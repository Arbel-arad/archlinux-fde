#!/usr/bin/env bash
{
	if mountpoint -q ~; then
		umount ~
	else
		fido_dev=#(systemd-cryptenroll --fido-device=list | grep '^/dev/hidraw[0-9]\+' -o)
		gocryptfs --fido2=$fido_dev /mnt/home.crypt ~ -nonempty -q -fsck
	fi
}