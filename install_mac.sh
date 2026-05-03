sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/jgluna/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/jgluna/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
brew install git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install stow
git clone https://github.com/jgluna/dotflies.git
rm .zshrc
(
   cd dotflies || exit 1 # Exit subshell if cd fails
   stow zshrc
)
sh -c "$(curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh)"
brew install direnv
brew install eza
sh -c "$(curl https://mise.run)"
(
   cd dotflies || exit 1 # Exit subshell if cd fails
   stow mise
)
mise trust mise/config.toml
mise install
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
brew install --cask ghostty
(
   cd dotflies || exit 1 # Exit subshell if cd fails
   stow ghostty
)
brew install bob
bob use stable
(
   cd dotflies || exit 1 # Exit subshell if cd fails
   stow nvim
)
brew install --cask nikitabobko/tap/aerospace
(
   cd dotflies || exit 1 # Exit subshell if cd fails
   stow aerospace
)
sh -c "$(curl -fsSL https://claude.ai/install.sh)"
brew install --cask alt-tab
brew install --cask slack
brew install --cask beekeeper-studio
brew install --cask obsidian
