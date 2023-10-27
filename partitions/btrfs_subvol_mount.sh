#!/usr/bin/env bash
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@ /dev/mapper/cryptroot /mnt
mkdir -p /mnt/{efi,home,tmp,usr,dev/shm,var,.snapshots}
mount -o nodev,nosuid,noexec /dev/disk/by-label/EFI /mnt/efi
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@home,nodev,nosuid /dev/mapper/cryptroot /mnt/home
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@tmp,nodev,nosuid,noexec /dev/mapper/cryptroot /mnt/tmp
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@usr,nodev /dev/mapper/cryptroot /mnt/usr
mkdir -p /mnt/usr/share
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@usr_share,nodev,nosuid /dev/mapper/cryptroot /mnt/usr/share
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@dev_shm,nodev,nosuid,noexec /dev/mapper/cryptroot /mnt/dev/shm
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@var,nodev /dev/mapper/cryptroot /mnt/var
mkdir -p /mnt/var/{tmp,log,account}
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@var_tmp,nodev,nosuid,noexec /dev/mapper/cryptroot /mnt/var/tmp
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@var_log,nodev,nosuid,noexec /dev/mapper/cryptroot /mnt/var/log
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@var_account,nodev,nosuid,noexec /dev/mapper/cryptroot /mnt/var/account
mount -o defaults,compress=zstd:1,discard=async,ssd,subvol=@.snapshots,nodev,nosuid,noexec /dev/mapper/cryptroot /mnt/.snapshots