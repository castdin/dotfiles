# Brew
export PATH="/opt/homebrew/bin:$PATH"

# Bun
[ -s "/Users/c/.bun/_bun" ] && source "/Users/c/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Fuck
eval $(thefuck --alias)
