#!/bin/bash
# Restaura la configuración de GRUB y las entradas personalizadas
set -e

echo "==> Restaurando /etc/default/grub..."
cat > /etc/default/grub << 'EOF'
GRUB_DEFAULT=0
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR=`( . /etc/os-release && echo ${NAME} )`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX=""
GRUB_DISABLE_OS_PROBER=false
EOF

echo "==> Restaurando entradas personalizadas en /etc/grub.d/40_custom..."
cat > /etc/grub.d/40_custom << 'EOF'
#!/bin/sh
exec tail -n +3 $0
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.

menuentry 'Windows 1 (Kingston SSD)' --class windows --class os {
	insmod part_gpt
	insmod fat
	search --no-floppy --fs-uuid --set=root 0C9E-7BB1
	chainloader /EFI/Windows1/Boot/bootmgfw.efi
}

menuentry 'Windows 2 (NVMe)' --class windows --class os {
	insmod part_gpt
	insmod fat
	search --no-floppy --fs-uuid --set=root 0C9E-7BB1
	chainloader /EFI/Windows2/Boot/bootmgfw.efi
}
EOF
chmod +x /etc/grub.d/40_custom

echo "==> Ejecutando update-grub..."
update-grub

echo ""
echo "Listo. GRUB restaurado y actualizado."
