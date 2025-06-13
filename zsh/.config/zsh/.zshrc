# Set history options
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Don't beep
setopt NO_BEEP

# path
export PATH="$HOME/dotfiles/bin:$HOME/go/bin:$PATH"

# Prompt placeholder
# PROMPT='%n@%m %1~ %# '

# Load additional configs from ~/.config/zsh if needed
# [[ -f ~/.config/zsh/plugins.zsh ]] && source ~/.config/zsh/plugins.zsh

# Enable Starship prompt
eval "$(starship init zsh)"

# Antidote plugin loading
source "${ZDOTDIR:-$HOME/.config/zsh}/antidote/antidote.zsh"

# Load plugins from list
antidote load

# Start ssh-agent if not running
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519-siabrac 2>/dev/null
fi
