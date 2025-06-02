# brew
export PATH="/opt/homebrew/bin:$PATH"

# fuck
eval $(thefuck --alias)

# pnpm
alias pm='pnpm'
export PNPM_HOME="/Users/c/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# terraform
alias tf='terraform'
