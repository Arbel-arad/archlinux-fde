#!/usr/bin/env bash
read -p "username: " username
useradd -m -G wheel -g users -s /bin/zsh ${username}
mkdir -p /home/{${username},${username}.crypt}
chown -R ${username}:users /home/{${username},${username}.crypt}
sudo su ${username} -c 'gocryptfs -init --fido2=$fido_dev /home/$(whoami).crypt'
sudo su ${username} -c 'gocryptfs --fido2=$fido_dev /home/$(whoami).crypt ~ -nonempty -q'
passwd ${username}