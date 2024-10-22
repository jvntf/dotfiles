echo Y | apt-get install zsh
chsh -s $(which zsh)
yes | gcloud components install gke-gcloud-auth-plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#echo "set -g default-terminal \"screen-256color\"" >> ~/.tmux.conf
#echo "set-option -g history-limit 100000" >> ~/.tmux.conf

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
echo >> /root/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install node
#cp ~/.coc-settings.json ~/.vim/coc-settings.json
#brew unlink python
brew install vim ripgrep fzf redis awscli k9s
pip install ruff
pip install anyscale
apt-get install psmisc
. .venv/bin/activate
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


echo "export POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=true" >> /root/.zshrC
source ~/.zshrc
