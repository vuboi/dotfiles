# Use modern completion system
autoload -Uz compinit; compinit
# ============================== History zsh ==============================
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
# ============================== Path export && setup ==============================
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/home/vuboi/Desktop/flutter/bin"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
# Color terminal
path+=($(ruby -e 'puts File.join(Gem.user_dir, "bin")'))
# Config NVM
# Lazy loads NVM
lazynvm() {
  unset -f nvm node npm npx
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  if [ -f "$NVM_DIR/bash_completion" ]; then
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
  fi
}

nvm() {
  lazynvm 
  nvm $@
}
 
node() {
  lazynvm
  node $@
}
 
npm() {
  lazynvm
  npm $@
}

npx() {
  lazynvm
  npx $@
}

# ============================== Plugin zsh && themes ==============================
export PATH="$PATH:/usr/local/bin"
# eval "$(oh-my-posh --init --shell zsh --config ~/.oh-my-posh/themes/mythemes.json)"
# eval "$(oh-my-posh --init --shell zsh --config ~/.oh-my-posh/themes/new-themes.json)"

source ~/.oh-my-posh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-posh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-posh/plugins/enhancd/init.sh
source ~/.oh-my-posh/plugins/yarn/yarn.plugin.zsh
source ~/.oh-my-posh/plugins/npm/npm.plugin.zsh
source ~/.oh-my-posh/plugins/git-auto-fetch/git-auto-fetch.plugin.zsh
# source ~/.oh-my-posh/plugins/git/git.plugin.zsh

#Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
# ============================== Alias ==============================
#Yarn
alias ys='yarn start'
alias c='code .'
alias ngs='ng serve'
alias ni="npm install"
alias wac="warp-cli connect"
alias wad="warp-cli disconnect"
alias war="warp-cli register"
alias kp="npx kill-port"
#Ubuntu
alias h='history'
alias hs='history | grep'
alias hsi='history | grep -i'
alias copypath='pwd | tr -d "\n" | xclip -sel clip'
# Update the packages confirming with 'yes' to the prompt.
alias update='sudo apt-get update -y'
# Update the packages confirming with 'yes',
# Upgrade the packages confirming with 'yes',
# Remove unused packeges and temporary files,
# Remove old version of packages.
alias upgrade='sudo apt-get update -y && \
                sudo apt-get upgrade -y && \
                sudo apt-get dist-upgrade && \
                sudo apt-get autoremove && \
                sudo apt-get autoclean'

# Remove unused packeges and temporary files,
# Remove old version of packages.
alias clean='sudo apt-get autoremove && \
                sudo apt-get autoclean'
# Count total files & directories.
alias count='echo && \
             echo -e "Count in\033[0;32m $PWD" && \
             echo -e "\033[0;31m$(find . -type f | wc -l)\033[1;37m files." && \
             echo -e "\033[0;34m$(find . -type d | wc -l)\033[1;37m directories." && \
             echo'
alias remove='sudo apt-get purge --auto-remove'
alias ll="ls -la"
alias sai="sudo apt install"
alias rm="rm -r"
alias rmrf="rm -rf"
alias rmd="rm -d"
alias CD="cd"
alias we="curl wttr.in/hochiminh"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias gcb="git branch --show-current | pbcopy"
alias lg='lazygit'
#Base ArchLinux
alias clean='sudo du -sh ~/.cache/ && rm -rf ~/.cache/*'
alias sps='sudo pacman -S'
alias sprs='sudo pacman -Rs'
alias spqs='sudo pacman -Qs'
alias spss='sudo pacman -Ss'
alias spu='sudo pacman -Syu'
alias spyu='sudo pacman -Syyu'
alias spc='sudo pacman -Scc'
alias spq='sudo pacman -Rns $(pacman -Qtdq)'
# Git 
#alias ga='git add'
alias gcos="git checkout staging",
alias gcmr="git commit -m  'Merge && resolve conflict'"
alias gpos="git pull origin staging"
alias gcod="git checkout dev"
alias gm="git merge"
alias gcou="git checkout ."
alias gc='git clone'
alias ga='git add .'
alias gl='git log'
alias glg="git lg"
alias glo='git log --pretty=format:"%h %ad %s" --date=short '
alias gla='git log --pretty=format:"%h %ad %s" --date=short --all'
alias grh='git reset --hard'
alias gs='git stash'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gb='git branch'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcs='git checkout staging'
alias gpu='git push'
alias gp='git pull'
alias gpos='git pull origin staging'
alias gst='git status'
alias gri='git rebase -i'
alias gcp='git cherry-pick'
alias gbr='git branch -r'
#alias gaaa='git add --all'
#alias gau='git add --update'
##alias gbd='git branch --delete '
#alias gc='git commit'
#alias gcf='git commit --fixup'
#alias gcob='git checkout -b'
#alias gcom='git checkout master'
#alias gcod='git checkout develop'
#alias gd='git diff'
#alias gda='git diff HEAD'
#alias gi='git init'
#alias glg='git log --graph --oneline --decorate --all'
#alias gm='git merge --no-ff'
#alias gma='git merge --abort'
#alias gmc='git merge --continue'
#alias gpr='git pull --rebase'
#alias gr='git rebase'
#alias gss='git status --short'
#alias gstd='git stash drop'
#alias gstl='git stash list'
#alias gstp='git stash pop'
#alias gsts='git stash save'

#Colorls 
alias ls='colorls'          #Colorls with no options
alias lx='colorls -lX'      #List, sort by file type
alias lS='colorls -lS'      #List, sort by size (largest first)
alias ll2='colorls --tree=2' #Show tree heirarchy, capped at depth 
alias ll3='colorls --tree=3' #Show tree heirarchy, capped at depth
alias ll4='colorls --tree=4' #Show tree heirarchy, capped at depth
alias ll5='colorls --tree=5' #Show tree heirarchy, capped at depth
# ============================== Key bindings for zsh ==============================
bindkey '^?'      backward-delete-char          # bs         delete one char backward
bindkey '^[[3~'   delete-char                   # delete     delete one char forward
bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
bindkey '^[[F'    end-of-line                   # end        go to the end of line
bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
bindkey '^[[3;5~' kill-word                     # ctrl+del   delete next word
bindkey '^J'      backward-kill-line            # ctrl+j     delete everything before cursor
bindkey '^[[D'    backward-char                 # left       move cursor one char backward
bindkey '^[[C'    forward-char                  # right      move cursor one char forward
bindkey '^[[A'    history-beginning-search-backward   # up         prev command in history
bindkey '^[[B'    history-beginning-search-forward # down       next command in history
bindkey '^[[5~'   up-line-or-beginning-search # pageup
bindkey '^[[6~'   down-line-or-beginning-search # pagedown


# Load Angular CLI autocompletion.
#source <(ng completion script)


#========================================================= Some New Setting For ZSH PROFILE #=========================================================
# 021011 zsh theme v2.0.0 - https://github.com/guesswhozzz/021011.zsh-theme

# LOCAL/VARIABLES/ANSI =========================================================

local ANSI_reset="\x1B[0m"
local ANSI_dim_black="\x1B[38;05;236m"

# LOCAL/VARIABLES/GRAPHIC ======================================================

local char_arrow="›"                                            #Unicode: \u203a
local char_up_and_right_divider="└"                             #Unicode: \u2514
local char_down_and_right_divider="┌"                           #Unicode: \u250c
local char_vertical_divider="─"                                 #Unicode: \u2500

# SEGMENT/VCS_STATUS_LINE ======================================================

export VCS="git"

local current_vcs="\":vcs_info:*\" enable $VCS"
local char_badge="%F{238} 𝗈𝗇 %f%F{236}${char_arrow}%f"
local vc_branch_name="%F{85}%b%f"

local vc_action="%F{238}%a %f%F{236}${char_arrow}%f"
local vc_unstaged_status="%F{80} M ${char_arrow}%f"

local vc_git_staged_status="%F{115} A ${char_arrow}%f"
local vc_git_hash="%F{151}%6.6i%f %F{236}${char_arrow}%f"
local vc_git_untracked_status="%F{74} U ${char_arrow}%f"


if [[ $VCS != "" ]]; then
  autoload -Uz vcs_info
  eval zstyle $current_vcs
  zstyle ':vcs_info:*' get-revision true
  zstyle ':vcs_info:*' check-for-changes true
fi

case "$VCS" in 
   "git")
    # git sepecific 
    zstyle ':vcs_info:git*+set-message:*' hooks use_git_untracked
    zstyle ':vcs_info:git:*' stagedstr $vc_git_staged_status
    zstyle ':vcs_info:git:*' unstagedstr $vc_unstaged_status
    zstyle ':vcs_info:git:*' actionformats "  ${vc_action} ${vc_git_hash}%m%u%c${char_badge} ${vc_branch_name}"
    zstyle ':vcs_info:git:*' formats " %c%u%m${char_badge} ${vc_branch_name}"
  ;;

  # svn sepecific 
  "svn")
    zstyle ':vcs_info:svn:*' branchformat "%b"
    zstyle ':vcs_info:svn:*' formats " ${char_badge} ${vc_branch_name}"
  ;;

  # hg sepecific 
  "hg")
    # echo "ставим hg переменные для vcs_info"
    zstyle ':vcs_info:hg:*' branchformat "%b"
    zstyle ':vcs_info:hg:*' formats " ${char_badge} ${vc_branch_name}"
  ;;
esac

# Show untracked file status char on git status line
+vi-use_git_untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]] &&
    git status --porcelain | grep -m 1 "^??" &>/dev/null; then
    hook_com[misc]=$vc_git_untracked_status
  else
    hook_com[misc]=""
  fi
}

# SEGMENT/SSH_STATUS ===========================================================

local ssh_marker=""

if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
 ssh_marker="%F{115}SSH%f%F{236}:%f"
fi

# UTILS ========================================================================

setopt PROMPT_SUBST

# Prepare git status line
prepareGitStatusLine() {
  echo '${vcs_info_msg_0_}'
} 

# Prepare prompt line limiter
printPsOneLimiter() {
  local termwidth
  local spacing=""
  
  ((termwidth = ${COLUMNS} - 1))
  
  for i in {1..$termwidth}; do
    spacing="${spacing}${char_vertical_divider}"
  done
  
  echo $ANSI_dim_black$char_down_and_right_divider$spacing$ANSI_reset
}

# ENV/VARIABLES/PROMPT_LINES ===================================================

PROMPT="%F{236}${char_up_and_right_divider} ${ssh_marker} %f%F{80}%~%f$(prepareGitStatusLine)
%F{85} ${char_arrow}%f "

RPROMPT=""

# ENV/HOOKS ==================================================================== 

precmd() {
  if [[ $VCS != "" ]]; then
    vcs_info
  fi
  printPsOneLimiter
}

# ENV/VARIABLES/LS_COLORS ======================================================

LSCOLORS=gxafexDxfxegedabagacad
export LSCOLORS

LS_COLORS=$LS_COLORS:"di=36":"ln=30;45":"so=34:pi=1;33":"ex=35":"bd=34;46":"cd=34;43":"su=30;41":"sg=30;46":"ow=30;43":"tw=30;42":"*.js=01;33":"*.json=33":"*.jsx=38;5;117":"*.ts=38;5;75":"*.css=38;5;27":"*.scss=38;5;169"
export LS_COLORS

# SEGMENT/COMPLETION ===========================================================

setopt MENU_COMPLETE

local completion_descriptions="%B%F{85} ${char_arrow} %f%%F{green}%d%b%f"
local completion_warnings="%F{yellow} ${char_arrow} %fno matches for %F{green}%d%f"
local completion_error="%B%F{red} ${char_arrow} %f%e %d error"

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list "m:{a-z}={A-Z}"
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:*:*:descriptions' format $completion_descriptions
zstyle ':completion:*:*:*:*:corrections' format $completion_error
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS} "ma=38;5;253;48;5;23"
zstyle ':completion:*:*:*:*:warnings' format $completion_warnings
zstyle ':completion:*:*:*:*:messages' format "%d"

zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:approximate:*' max-errors "reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )"
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns "*?.o" "*?.c~" "*?.old" "*?.pro"
zstyle ':completion:*:functions' ignored-patterns "_*"

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# ==============================================================================
#Company Setting Alias
alias toolkits='./tools/scripts/npm.sh start test toolkits'
alias demo='./tools/scripts/npm.sh start test demo'
alias dashboard='./tools/scripts/npm.sh start test dashboard'
alias css='./tools/scripts/code-standardization/atomic-css/atomic-css.sh'
alias build='./tools/scripts/npm.sh build'
alias start='./tools/scripts/npm.sh start'
# alias code='code-insiders'
# -1 is file not hidden, -1a is include hidden file, wc: count word, -l is line
alias cf='ls -1 | wc -l'  
alias cfh='ls -1a | wc -l'
# $1 is source dir, $2 file name, ex: sample.txt or *.txt, $3 target dir
# Copy all file (include subfolder) overwrite
cpa() {
  if [[ $3 == *"."* ]]; then
    find $1 -type f -name "$3" -exec cp -r {} $2 \;
    echo "Copy $2 to $3 success!"
  elif [ -z "$3" ]; then
    find $1 -type f -name "*" -exec cp -r {} $2 \;
    echo "Copy all file to $3 success!"
  else 
    temp=${2//./}
    find $1 -type f -name "*.$3" -exec cp -r {} $2 \;
    echo "Copy all file $2 to $3 success!"
  fi
}

#Move all file (include subfolder) overwrite
mva() {
  if [[ $3 == *"."* ]]; then
    find $1 -type f -name "$3" -exec mv -u {} $2 \;
    echo "Move $2 to $3 success!"
  elif [ -z "$3" ]; then
    find $1 -type f -name "*" -exec mv -u {} $2 \;
    echo "Move all file $2 to $3 success!"
  else 
    temp=${2//./}
    find $1 -type f -name "*.$3" -exec mv -u {} $2 \;
    echo "Move all file $2 to $3 success!"
  fi
}

