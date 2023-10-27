#!/usr/bin/env bash
read -p "username: " username
useradd -m -G wheel -g users -s /bin/zsh ${username}
mkdir -p /home/{${username},${username}.crypt}
gocryptfs -init --fido2=$fido_dev /home/${user}.crypt
chown -R ${username}:users /home/{${username},${username}.crypt}
passwd ${username}
su ${username} -c 'username=$(whoami) && gocryptfs --fido2=$fido_dev /home/${username}.crypt ~ -nonempty -q'