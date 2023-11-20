read -p "enter EFI device [/dev/sda]: " efi_dev
efi_dev=${efi_dev:-"/dev/sda"}
read -p "enter EFI partition number [1]: " efi_part
efi_part=${efi_part:-"1"}
read -p "UEFI entry name [ArchLinux]: " efi_name
efi_name=${efi_name:-ArchLinux}
dracut /efi//EFI/BOOT/BOOTx64.EFI --force --kver $(ls /lib/modules/ | grep arch)
efibootmgr --create --disk ${efi_dev} --part ${efi_part} --label ${efi_name} --loader /EFI/BOOT/BOOTx64.EFI`