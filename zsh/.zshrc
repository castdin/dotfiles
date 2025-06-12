source "$HOME/.zsecrets"
export PATH="$PATH:/Users/c/.local/bin"

# brew
export PATH="/opt/homebrew/bin:$PATH"

# fuck
eval $(thefuck --alias)

# n - https://github.com/tj/n
export N_PREFIX="$HOME/.local/n"
export PATH="$N_PREFIX/bin:$PATH"

# pnpm
alias p='pnpm'
export PNPM_HOME="/Users/c/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# python
export PATH="$(brew --prefix python)/libexec/bin:$PATH"

# terraform
alias tf='terraform'
