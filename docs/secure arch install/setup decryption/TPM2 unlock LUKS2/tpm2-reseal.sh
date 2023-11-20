read -p "path to device: " luks_device
read -p "tpm2-totp password: " totp_pass
tpm2-totp reseal -P ${totp_pass}
systemd-cryptenroll --wipe-slot=tpm2 --unlock-fido2-device=auto --tpm2-device=auto --tpm2-pcrs=1+7+9+12 --tpm2-with-pin=yes ${luks_device}
cryptsetup luksDump ${luks_device}