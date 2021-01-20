# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/rlemas/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(user host dir git node exec_time line_sep jobs exit_code char)

# Remove the username:hostname from command line
DEFAULT_USER=$USER
prompt_context() {}

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-yarn
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rlemas/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rlemas/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rlemas/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rlemas/google-cloud-sdk/completion.zsh.inc'; fi

# Update path
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$PATH:/Users/rlemas/Tools/flutter/bin"
export PATH="$PATH:/Users/rlemas/Library/Python/2.7/bin"
export PATH="$PATH:/Users/rlemas/.platformio/penv/bin"

# Allow Android simulator from command line
export ANDROID_SDK_ROOT="/Users/rlemas/Library/Android/sdk"
export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
export PATH="$PATH:/Users/rlemas/Tools/Easimulator"

# JAVA HOME path used by Android Studio (and thus react-native run-android)

# doesnt work ?
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/home"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ALIAS
alias rr="adb shell input keyevent 82 && adb shell input keyevent RR"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias rnse="react-native run-ios --simulator 'iPhone SE'"
alias rnip="yarn react-native run-ios --scheme AppRestaurant-Staging --simulator='iPad Pro (9.7-inch)'"
alias git-clean="git branch --merged | grep -v '*' | xargs git branch -D"
alias config='/usr/bin/git --git-dir=/Users/rlemas/.git_dotfiles/ --work-tree=/Users/rlemas'
alias gap="git add -p"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcm="git commit -m"
alias gst="git status"
alias glg="git lg"
alias gpf="git push --force-with-lease"
alias gcp="git cherry-pick"
alias studio="/Applications/'Android Studio.app'/Contents/MacOS/studio"
alias gs="git stash"
alias y="yarn"
alias cpcommit="git log -1 | head -1 | cut -c 8- | pbcopy"

# ZB VPN
alias vpn="sudo openfortivpn -c ~/Tools/openfortivpn/config"

# project specific
alias deployIosSdk="cd SdkGeneration && yarn sdk:generate:debug && .. && git add . && gcm "build and deploy" && git push && cpcommit && notif "ios sdk is built" "And the last commit is copied""

notif() {
  osascript -e "display notification \"$2\" with title \"$1\""
}

plugins=(... zsh-iterm-touchbar)

flowfile() {
	yarn flow check-contents $1 < $1
}

emailgen() {
	NUMBER = $(cat ~/Dev/number)
	echo $((NUMBER + 1)) > number 
}


# Base16 Shell
BASE16_SHELL="$HOME/.vim_runtime/misc/base16-shell"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] &&  eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_isotope
source ~/.vim_runtime/misc/base16-fzf/bash/base16-isotope.config

# fnm
export PATH=/Users/rlemas/.fnm:$PATH
eval "`fnm env`"
