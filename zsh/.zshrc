# brew
export PATH="/opt/homebrew/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# fuck
eval $(thefuck --alias)

# gcloud
if [ -f '/Users/c/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/c/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/c/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/c/google-cloud-sdk/completion.zsh.inc'; fi

# go
export PATH="$HOME/go/bin:$PATH"

# n - https://github.com/tj/n
export N_PREFIX="$HOME/.local/n"
export PATH="$N_PREFIX/bin:$PATH"

# pnpm
alias p='pnpm'
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# python
export PATH="$(brew --prefix python)/libexec/bin:$PATH"

# Rancher Desktop
export PATH="$HOME/.rd/bin:$PATH"

# terraform
alias tf='terraform'

# zsh
alias lsa='ls -A1'
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
export PATH="$PATH:/Users/c/.local/bin"
export PS1='%# '
