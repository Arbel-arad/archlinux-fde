#!/usr/bin/env bash
user=$(whoami)
fido_dev=$(systemd-cryptenroll --fido2-device=list | grep '^/dev/hidraw[0-9]\+' -o)
{
	if mountpoint -q ~; then
		umount ~
	fi
}

gocryptfs --fido2=$fido_dev /home/${user}.crypt ~ -nonempty -q