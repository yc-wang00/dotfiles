#!/bin/bash
sudo apt update
# Install core dependencies
sudo apt install -y zsh curl git vim wget snapd

# Make zsh default
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install custom plugins for oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Remove default .zshrc and replace with custom .zshrc
rm ~/.zshrc && cp .zshrc_custom ~/.zshrc
source ~/.zshrc

# Install cargo
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Depot
curl -L https://depot.dev/install-cli.sh | sh
export PATH="/home/coder/.depot/bin:$PATH"

# Install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
