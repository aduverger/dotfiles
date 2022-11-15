export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short
export AUTO_TITLE_SCREENS="NO"

# Match auto-completion case_sensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit -i

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'git:(%b)%u%c '
zstyle ':vcs_info:git:*' actionformats '(%b)%a%u%c '

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
export PROMPT='
%* | %B%F{116}%2~%f %F{magenta}${vcs_info_msg_0_}%f%b
%(?.%F{green}➜ .%F{red}?%?)%f '

set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

export PATH=$HOME/.toolbox/bin:$PATH
export JAVA_HOME=$(dirname $(dirname $(realpath /usr/bin/java)))
export PATH=$JAVA_HOME/bin:$PATH

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR=code
export EDITOR=code
