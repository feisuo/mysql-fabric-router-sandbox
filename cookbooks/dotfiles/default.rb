# -*- coding: utf-8 -*-

execute 'setup dotfiles' do
  not_if "ls $HOME/dotfiles"
  user "vagrant"
  command '
cd $HOME
git clone https://github.com/matsumana/dotfiles.git
ln -s ./dotfiles/.gitconfig        ./.gitconfig
ln -s ./dotfiles/.gitignore_global ./.gitignore_global
ln -s ./dotfiles/.emacs.d          ./.emacs.d
ln -s ./dotfiles/.gemrc            ./.gemrc
ln -s ./dotfiles/.zshrc            ./.zshrc
ln -s ./dotfiles/.zshrc.mine       ./.zshrc.mine
ln -s ./dotfiles/.zshrc.anyframe   ./.zshrc.anyframe
mkdir .zsh
cd $_
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/mollifier/anyframe.git
git clone https://github.com/m4i/cdd.git

cd $HOME
sed -i".bak" -E "s@cyan@green@g" ./dotfiles/.zshrc
'
end

execute 'install peco' do
  not_if "ls /usr/local/bin/peco"
  command '
cd /usr/local/src
curl -O -L https://github.com/peco/peco/releases/download/v0.3.3/peco_linux_amd64.tar.gz
tar xvf peco_linux_amd64.tar.gz
sudo cp -f peco_linux_amd64/peco /usr/local/bin
'
end
