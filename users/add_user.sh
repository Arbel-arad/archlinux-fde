#!/usr/bin/env bash
fido_dev=$(systemd-cryptenroll --fido2-device=list | grep '^/dev/hidraw[0-9]\+' -o)
read -p "username: " username
sudo useradd -m -G wheel -g users -s /bin/zsh ${username}
sudo mkdir -p /home/{${username},${username}.crypt}
sudo gocryptfs -init --fido2=${fido_dev} /home/${username}.crypt
sudo cp -i -r .config /home/${username}
sudo chmod +x /home/${username}/.config/hypr/scripts/mount_home.sh
sudo gocryptfs --fido2=${fido_dev} /home/${username}.crypt /home/${username} -nonempty -q
#copy user files now
sudo umount /home/${username}
sudo chown -R ${username}:users /home/{${username},${username}.crypt}
sudo passwd ${username}