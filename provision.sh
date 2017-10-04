echo 'Updating package repository list...'
apt-get -y -qq update

echo 'GUI'
echo '---'
echo 'Installing X.Org X server...'
apt-get -y -qq install --no-install-recommends xserver-xorg
echo 'Installing Xfce Lightweight Desktop Environment...'
apt-get -y -qq install xfce4
echo 'Installing Xfce terminal emulator...'
apt-get -y -qq install xfce4-terminal
echo 'Installing lightdm...'
apt-get -y -qq install lightdm

echo
echo 'Locale and time'
echo '---------------'
echo 'Setting keyboard layout...'
localectl set-keymap es
echo 'Setting timezone...'
timedatectl set-timezone "Europe/Madrid"
echo 'Enabling NTP...'
timedatectl set-ntp true

echo
echo 'Python'
echo '------'
echo 'Installing Python 3...'
apt-get -y -qq install python3
echo 'Installing pip...'
apt-get -y -qq install python3-pip
echo 'Installing virtualenv...'
pip3 install virtualenv
echo 'Installing virtualenvwrapper...'
pip3 install virtualenvwrapper
echo >> /home/vagrant/.bashrc
VAGRANT_HOME=/home/vagrant
echo "export WORKON_HOME=$VAGRANT_HOME/.virtualenvs" >> $VAGRANT_HOME/.bashrc
echo "export PROJECT_HOME=$VAGRANT_HOME/Devel" >> $VAGRANT_HOME/.bashrc
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> $VAGRANT_HOME/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> $VAGRANT_HOME/.bashrc
echo 'Installing Idle 3...'
apt-get -y -qq install idle3
echo 'Installing PyCharm Community Edition...'
wget -q https://download.jetbrains.com/python/pycharm-community-2017.2.3.tar.gz
tar xfz pycharm-community-2017.2.3.tar.gz -C /opt/
rm pycharm-community-2017.2.3.tar.gz
echo 'Installing git...'
apt-get -y -qq install git
echo 'Installing emacs...'
apt-get -y -qq install emacs

echo
echo 'VirtualBox Guest Additions'
echo '--------------------------'
# https://www.vagrantup.com/docs/virtualbox/boxes.html#virtualbox-guest-additions
echo 'Installing linux kernel headers...'
apt-get -y -qq install linux-headers-$(uname -r)
echo 'Installing basic developer tools...'
apt-get -y -qq install build-essential dkms
echo 'Intalling VirtualBox Guest Additions...'
wget -q http://download.virtualbox.org/virtualbox/5.1.28/VBoxGuestAdditions_5.1.28.iso
mkdir /media/VBoxGuestAdditions
mount -o loop,ro VBoxGuestAdditions_5.1.28.iso /media/VBoxGuestAdditions
sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_5.1.28.iso
umount /media/VBoxGuestAdditions
rmdir /media/VBoxGuestAdditions