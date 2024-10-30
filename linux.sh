#install sudo, add user to sudoers and login as user
apt install sudo -y
usermod -aG sudo aurel
su aurel
#input user pw

#enable ssh with ufw
sudo apt install ufw
sudo ufw enable
sudo ufw allow 4242/tcp

#change port in /etc/sshd_config
echo "Port 4242" >>/etc/sshd_config

## get ssh key to github to clone dotfiles
sudo apt install xsel -y

ssh-keygen -t ed25519
#confirm keygen

cat ~/.ssh/id_ed25519.pub | tee <(xsel -b)
#prompt to copy key into github

#install git and clone dotfiles
sudo apt install git -y
git clone "blabla" dotfiles
./create_symlinks.sh


sudo apt install vim-gtk3 -y
sudo apt install gcc -y
sudo apt install gdb -y
sudo apt install valgrind -y
sudo apt install lldb -y
sudo apt install llvm -y
sudo apt install tmux -y

#don't forget to change root and user PW !!!!!
