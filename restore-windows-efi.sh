#!/bin/bash
# Restaura las entradas EFI de Windows
# EFI partition: /dev/sdc, particion 3, GPT GUID: ae11207b-3e8d-4f15-8a83-db8daaaa94fb

set -e

DISK=/dev/sdc
PART=3

echo "Añadiendo Windows Boot Manager..."
efibootmgr --create \
  --disk "$DISK" \
  --part "$PART" \
  --label "Windows Boot Manager" \
  --loader '\EFI\Microsoft\Boot\bootmgfw.efi'

echo "Añadiendo Windows Boot Manager 2..."
efibootmgr --create \
  --disk "$DISK" \
  --part "$PART" \
  --label "Windows Boot Manager 2" \
  --loader '\EFI\Microsoft\Boot\bootmgfw.efi'

echo ""
echo "Listo. Entradas actuales:"
efibootmgr
