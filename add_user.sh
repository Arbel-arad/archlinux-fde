#!/usr/bin/env bash
fido_dev=$(systemd-cryptenroll --fido2-device=list | grep '^/dev/hidraw[0-9]\+' -o)
read -p "username: " username
useradd -m -G wheel -g users -s /bin/zsh ${username}
mkdir -p /home/{${username},${username}.crypt}
chown -R ${username}:users /home/{${username},${username}.crypt}
sudo gocryptfs -init --fido2=${fido_dev} /home/$(whoami).crypt
sudo gocryptfs --fido2=${fido_dev} /home/$(whoami).crypt ~ -nonempty -q
passwd ${username}