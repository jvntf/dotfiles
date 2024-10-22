#!/bin/bash
apt-get update

echo Y | apt-get install zsh
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

yes | gcloud components install gke-gcloud-auth-plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#echo "set -g default-terminal \"screen-256color\"" >> ~/.tmux.conf
#echo "set-option -g history-limit 100000" >> ~/.tmux.conf

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
echo >> /root/.zshrc

if ! grep -q  'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' /root/.zshrc; then
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.zshrc
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install node
#cp ~/.coc-settings.json ~/.vim/coc-settings.json
#brew unlink python
brew install nvim ripgrep fzf redis awscli k9s

# Create config directory if it doesn't exist
if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

# Create init.vim only if it doesn't exist
if [ ! -f ~/.config/nvim/init.vim ]; then
    cat > ~/.config/nvim/init.vim << 'EOL'
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOL
    echo "Created new init.vim"
else
    echo "init.vim already exists, skipping"
fi

# Install vim-plug if not already installed
if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echo "Installed vim-plug"
else
    echo "vim-plug already installed"
fi

. /root/streaming-inference/.venv/bin/activate

pip install ruff
pip install anyscale
apt-get install psmisc
alias watchgpu="watch -n 1 nvidia-smi"


P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

if [ ! -d "$P10K_DIR" ]; then
    echo "Powerlevel10k not found. Installing..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"

    # Set Powerlevel10k as the ZSH theme
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

    echo "Powerlevel10k installed successfully."
    echo "Please restart your terminal or run 'source ~/.zshrc' to apply changes."
else
    echo "Powerlevel10k is already installed."
fi


if ! grep -q "POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=true" /root/.zshrc; then
   echo "export POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=true" >> /root/.zshrc
fi
