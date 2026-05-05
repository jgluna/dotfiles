#!/usr/bin/env bash
set -euo pipefail

USERNAME=$(whoami)
HOME_DIR="$HOME"
LOCAL_BIN="$HOME_DIR/.local/bin"
ZPROFILE="$HOME_DIR/.zprofile"
ZSHRC="$HOME_DIR/.zshrc"

# ── Homebrew ──────────────────────────────────────────────────────────────────
# NONINTERACTIVE skips the "Press ENTER to continue" prompt.
# sudo password is still required (kept intentionally).
NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew to PATH for the rest of this script
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Persist brew env to .zprofile
echo >> "$ZPROFILE"
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> "$ZPROFILE"

# ── Core tools ────────────────────────────────────────────────────────────────
brew install git stow

# ── Oh My Zsh ─────────────────────────────────────────────────────────────────
# RUNZSH=no prevents it from switching shells mid-script
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ── Dotfiles ──────────────────────────────────────────────────────────────────
git clone https://github.com/jgluna/dotflies.git

# Remove default .zshrc only if it exists
rm -f "$ZSHRC"

(
  cd dotflies || exit 1
  stow zshrc
  stow mise
)

# ── ~/.local/bin on PATH (needed by zoxide, mise, Claude Code) ────────────────
export PATH="$LOCAL_BIN:$PATH"
# Persist it — written to .zshrc which stow just linked, so also add to .zprofile
# to cover login shells before .zshrc loads
echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$ZPROFILE"

# ── zoxide ────────────────────────────────────────────────────────────────────
sh -c "$(curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh)"

# ── More brew tools ───────────────────────────────────────────────────────────
brew install direnv eza

# ── mise ──────────────────────────────────────────────────────────────────────
curl https://mise.run | sh

# mise is now in ~/.local/bin which is already on PATH above
mise trust mise/config.toml
mise install

# ── ZSH plugins ───────────────────────────────────────────────────────────────
git clone https://github.com/zsh-users/zsh-autosuggestions \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# ── Ghostty ───────────────────────────────────────────────────────────────────
brew install --cask ghostty

(
  cd dotflies || exit 1
  stow ghostty
)

# ── bob (Neovim version manager) ──────────────────────────────────────────────
brew install bob
# --yes skips the "Add bob to PATH?" interactive prompt
echo "y" | bob use stable

(
  cd dotflies || exit 1
  stow nvim
)

# ── AeroSpace ─────────────────────────────────────────────────────────────────
brew install --cask nikitabobko/tap/aerospace

(
  cd dotflies || exit 1
  stow aerospace
)

# ── Claude Code ───────────────────────────────────────────────────────────────
sh -c "$(curl -fsSL https://claude.ai/install.sh)"

# ── Apps ──────────────────────────────────────────────────────────────────────
brew install --cask alt-tab slack beekeeper-studio obsidian keycastr
brew install lazygit

echo ""
echo "✅ Done! Open a new terminal (or run: source $ZPROFILE) to pick up all PATH changes."
