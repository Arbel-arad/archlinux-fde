#!/usr/bin/env bash
btrfs sub cr /mnt/@
btrfs sub cr /mnt/@home
btrfs sub cr /mnt/@tmp
btrfs sub cr /mnt/@usr
btrfs sub cr /mnt/@usr_share
btrfs sub cr /mnt/@dev_shm
btrfs sub cr /mnt/@var
btrfs sub cr /mnt/@var_tmp
btrfs sub cr /mnt/@var_log
btrfs sub cr /mnt/@var_account
btrfs sub cr /mnt/@.snapshots
btrfs sub list /mnt
umount /mnt