# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(user host dir git node exec_time line_sep jobs exit_code char)

# Remove the username:hostname from command line
DEFAULT_USER=$USER
prompt_context() {}

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( 
  git 
  zsh-z
  zsh-autosuggestions 
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export JAVA_HOME='/Users/rodolphe/Library/Java/jdk-18.0.1.1.jdk/Contents/home'

# User configuration

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

source ~/.config/base16-shell/scripts/base16-isotope.sh

# ALIAS
alias rr="adb shell input keyevent 82 && adb shell input keyevent RR"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias rna="yarn react-native run-android"
alias rni="yarn react-native run-ios"
alias git-clean="git branch --merged | grep -v '*' | xargs git branch -D"
alias gap="git add -p"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcm="git commit -m"
alias gst="git status"
alias glg="git lg"
alias gpf="git push --force-with-lease"
alias gcp="git cherry-pick"
alias wip="git add -A . && git commit -m 'WIP'"
alias studio="/Applications/'Android Studio.app'/Contents/MacOS/studio"
alias gs="git stash"
alias y="yarn"
alias cpcommit="git log -1 | head -1 | cut -c 8- | pbcopy"
alias rails="bundle exec rails"
alias config='/usr/local/bin/git --git-dir=/Users/rodolphe/.mydotfiles.cfg/ --work-tree=/Users/rodolphe'


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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init - zsh)"

export NPM_TOKEN=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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# automatic nvm use if .nvmrc found
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
skl_ec2_ip() {
    name=$1
    num_instance=$2

    usage="Usage: ${0} <ec2_tag_name>"

    if [[ -z ${num_instance} ]]; then
        num_instance=1
    fi

    if [[ ${num_instance} -lt 1 ]]; then
        echo "Invalid num instance. ${usage}"
        return 1
    fi

    ((num_instance=num_instance-1))

    if [[ ${name} == *"-prod" ]]; then
        profile="skl-prod"
    elif [[ ${name} == *"-stag" ]]; then
        profile="skl-staging"
    else
        echo "Invalid env. ${usage}"
        return 1
    fi

    ip=$(aws ec2 describe-instances         --query "Reservations[${num_instance}].Instances[0].PrivateIpAddress"         --filters "Name=tag:Name,Values=${name}" "Name=instance-state-name,Values=running"         --profile ${profile}         | tr -d \" | tr -d null)

    if [[ ${ip} == '' ]]; then
        echo "no ip"
        return 1;
    fi

    echo "${ip}"
    return 0
}

_skl_ec2_ips () {
  compadd skelloApp-clock-stag skelloApp-puma-stag skelloApp-sidekiq-stag svcBilling-puma-stag svcBitly-stag svcCommunication-puma-stag svcDocument-puma-stag svcPlanning-celery-stag svcPlanning-flask-stag skelloApp-clock-stag skelloApp-puma-stag skelloApp-sidekiq-stag svcBilling-puma-stag svcBitly-prod svcCommunication-puma-stag svcDocument-puma-stag svcPlanning-celery-stag svcPlanning-flask-stag
}

compdef _skl_ec2_ips skl_ec2_ip

fshow() {
  local out sha q
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --print-query); do
    q=$(head -1 <<< "$out")
    while read sha; do
      git show --color=always $sha | less -R
    done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
  done
}
