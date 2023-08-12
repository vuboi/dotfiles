const {
	      gi  : { GLib },
	      ui  : {
		      main         : {
			      sessionMode,
			      extensionManager,
			      panel: { statusArea: { quickSettings: { menu, _backgroundApps } } },
			      notify
		      },
		      quickSettings: { QuickMenuToggle },
		      popupMenu    : { PopupSeparatorMenuItem }
	      },
	      misc: {
		      extensionUtils: {
			      gettext: _,
			      ngettext,
			      getCurrentExtension,
			      getSettings,
			      initTranslations
		      },
		      util          : { formatTime }
	      }
      } = imports;

const { imports: { common }, dir, metadata } = getCurrentExtension();

class BoostExtension {
	constructor()
	{
		initTranslations();
	}

	enable()
	{
		// GNOME calls enable on every unlock. This code here needs to run only the first time, on user log-in
		if ( typeof this.cpuType === 'undefined' )
		{
			// Things depend on CPU type, so get it before everything else
			this.cpuType = common.getMyCpuType();

			// Proceed only if CPU is supported.
			if ( this.cpuType !== common.CPU_NOT_SUPPORTED )
			{
				const state    = common.getBoostState( this.cpuType );
				const settings = getSettings();

				// Turn off if it is on now, user has opted-in for persistence and the last time he turned off Boost
				if ( state && settings.get_boolean( 'persist' ) && !settings.get_boolean( 'boost' ) )
				{
					// Use existing labeling to indicated to the user that boost will be switched any moment now
					this.setNext( 5000, false );
				}
				else
				{
					// Always set state. This clears use cases of this sort:
					// 1. Disable Boost
					// 2. Reboot (this will enable Boost)
					// 3. Enable Persist (while Boost is on)
					// User will be prompted to disable Boost since setting is remembered from the last time he
					// clicked the switch. Clear it here, so that doesn't happen.
					settings.set_boolean( 'boost', state );
				}
			}
			// Otherwise alert the user this extension will not work.
			else
			{
				notify( metadata.name, _( 'Sorry, your CPU is NOT supported!' ) );
			}
		}
		// Timed switch was in progress when user locked the PC - resume
		else if ( typeof this.nextState !== 'undefined' && this.nextState !== common.getBoostState( this.cpuType ) )
		{
			const now = Date.now();

			// Time hasn't passed
			if ( now < this.nextIn )
			{
				this.setNext( this.nextIn - now, this.nextState );
			}
			// Time has finished while the extension was disabled
			else
			{
				this.setBoostState( this.nextState );
			}
		}

		if ( this.cpuType !== common.CPU_NOT_SUPPORTED )
		{
			this.toggle = new QuickMenuToggle( {
				title     : _( 'GHz Boost' ),
				toggleMode: true
			} );

			this.toggleClickedConnection = this.toggle.connect( 'clicked', item =>
			{
				// Ensure we do not show Until:
				this.nextState = item.get_checked();

				if ( this.changeBoostTimeout )
				{
					// Do not waste CPU time if user manually clicked to toggle the state - remove existing timeout, it
					// is no longer needed
					GLib.Source.remove( this.changeBoostTimeout );
				}

				// If manual toggling, we will not set a new changeBoostTimeout, but next time we come here, we will
				// try to clear non-existent timeout.
				this.changeBoostTimeout = null;

				this.setBoostState( this.nextState );
			} );

			// Get boost state every time user opens the quick menu, to ensure we are in sync
			this.menuConnection = menu.connect( 'open-state-changed', ( menu, isOpen ) => isOpen && this.setToggleState( common.getBoostState( this.cpuType ) ) );

			menu.addItem( this.toggle, 1 );

			// Ensure we are above the background apps menu
			menu._grid.set_child_below_sibling( this.toggle, _backgroundApps.quickSettingsItems[ 0 ] );
		}
	}

	disable()
	{
		this.toggle?.disconnect( this.toggleClickedConnection );
		this.toggle?.destroy();

		if ( this.menuConnection )
		{
			menu.disconnect( this.menuConnection );
		}

		GLib.Source.remove( this.changeBoostTimeout );

		this.toggle = this.menuConnection = this.changeBoostTimeout = this.toggleClickedConnection = null;

		// If user disabled the extension, bring back Boost to on (and save boolean)
		if ( this.cpuType !== common.CPU_NOT_SUPPORTED && sessionMode.currentMode === 'user' && !common.getBoostState( this.cpuType ) )
		{
			this.setBoostState( true );
		}
	}

	setToggleState( state )
	{
		if ( this.toggle )
		{
			const settings = getSettings();

			this.toggle.iconName = {
				true : 'power-profile-performance-symbolic',
				false: 'power-profile-power-saver-symbolic'
			}[ state ];

			this.toggle.set_checked( state );

			this.toggle[ 'menu-enabled' ] = !settings.get_boolean( 'clean' );

			// Populate the submenu and subtitle only if the user hasn't disabled that
			if ( this.toggle[ 'menu-enabled' ] )
			{
				const onOff = state ? _( 'ON' ) : _( 'OFF' );
				const STATE = typeof this.nextState === 'undefined' || state === this.nextState ? onOff : _( '{{STATE}}, until {{TIME}}' ).replace( '{{STATE}}', onOff ).replace( '{{TIME}}', formatTime( this.nextIn, { timeOnly: true } ).trim() );

				this.toggle.subtitle = STATE;

				this.toggle.menu.setHeader(
					this.toggle.iconName,
					_( 'Frequency Boost' ),
					_( 'CPU boost is currently {{STATE}}' ).replace( '{{STATE}}', STATE )
				);

				// Remove all items, since new items can be different
				this.toggle.menu.removeAll();

				// Add 3 items for timed boost ON/OFF
				[ 1, 12, 24 ].forEach( hours => this.toggle.menu.addAction( ngettext( 'Turn {{STATE}} for {{MINUTES}} hour', 'Turn {{STATE}} for {{MINUTES}} hours', hours )
						.replace( '{{STATE}}', state ? _( 'OFF' ) : _( 'ON' ) )
						.replace( '{{MINUTES}}', hours )
					, _ =>
					{
						this.setNext( hours * 60 * 60 * 1000, state );

						this.setBoostState( !state );
					}
				) );

				// Separate Preferences from the timed options
				this.toggle.menu.addMenuItem( new PopupSeparatorMenuItem() );

				this.toggle.menu.addAction( _( 'Preferences' ), _ =>
				{
					// Close the quick settings menu
					menu.close();

					extensionManager.openExtensionPrefs( metadata.uuid, '', {} );
				} );
			}
		}
	}

	setBoostState( state )
	{
		const settings = getSettings();
		// Moved to the set_boost file. Reason - more meaningful pkexec message
		/*const [ setting, value ] = [
		 [ 'intel_pstate/no_turbo', Number( !state ) ],
		 [ 'cpufreq/boost', Number( state ) ]
		 ][ cpuType ];

		 GLib.spawn_command_line_async( `pkexec bash -c "echo ${value} > /sys/devices/system/cpu/${setting}"` );*/

		common.pkexecCommand(
			[
				dir.get_child( 'set_boost' ).get_path(),
				// Subprocess is not happy if we leave those as numbers
				this.cpuType.toString(),
				Number( state ).toString(),
				settings.get_string( `epp-${state ? 'on' : 'off'}` ),
				settings.get_int( `epb-${state ? 'on' : 'off'}` ).toString()
			] )
			.then( _ =>
			{
				this.setToggleState( state );

				// Do not save the state if it is going to be only temporary
				if ( typeof this.nextState === 'undefined' || state === this.nextState )
				{
					settings.set_boolean( 'boost', state );
				}
			} )
			// We come here if something goes wrong inside the set_boost - we now have 3 things going on there
			// for Intel CPUs. Setting the Boost is actually last, so if any error occurs, boost will not be changed.
			// Reflect that on the UI (which is still visible if Polkit rules are added and no dialog appeared)
			.catch( _ => this.toggle?.set_checked( !this.toggle.get_checked() ) );
	}

	setNext( nextIn, nextState )
	{
		// Save nextIn so we can display calculated ", until " to the user
		this.nextIn = new Date( Date.now() + nextIn );
		// Save nextState for 2 reasons:
		// 1. Remove the closure here, which makes future code refactoring easier and garbage collection better.
		// 2. This controls if we are going to show the ", until " text to the user or not.
		this.nextState = nextState;

		this.changeBoostTimeout = GLib.timeout_add( GLib.PRIORITY_DEFAULT, nextIn, _ =>
		{
			const state = common.getBoostState( this.cpuType );

			// If something (like an external tool) changed the state, do not toggle it again
			if ( state !== this.nextState )
			{
				this.setBoostState( this.nextState );
			}

			this.changeBoostTimeout = null;

			// Destroy timeout
			return false;
		} );
	}
}

function init()
{
	return new BoostExtension();
}