#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE="$ROOT/profile"
WORK="$ROOT/work"
OUT="$ROOT/out"

[[ $EUID -eq 0 ]] || { echo "Utilise: sudo ./build-iso.sh"; exit 1; }
[[ "$(uname -m)" == "x86_64" ]] || { echo "Build x86_64 uniquement."; exit 1; }
command -v pacman >/dev/null || { echo "Le build doit être lancé sur Arch Linux."; exit 1; }

command -v mkarchiso >/dev/null 2>&1 || pacman -Sy --needed --noconfirm archiso

rm -rf "$PROFILE" "$WORK" "$OUT"
mkdir -p "$PROFILE" "$WORK" "$OUT"
cp -a /usr/share/archiso/configs/releng/. "$PROFILE/"

cat > "$PROFILE/packages.x86_64" <<'PKGS'
linux-zen
linux-zen-headers
base-devel
linux-firmware
networkmanager
git
curl
wget
sudo
nano
vim
bash-completion
pciutils
usbutils
lshw
hwinfo
parted
dosfstools
vulkan-tools
mesa
lib32-mesa
vulkan-icd-loader
lib32-vulkan-icd-loader
gamemode
lib32-gamemode
gamescope
mangohud
lib32-mangohud
steam
wine
winetricks
protontricks
pipewire
pipewire-alsa
pipewire-pulse
wireplumber
plasma-meta
plasma-wayland-session
sddm
xdg-desktop-portal
xdg-desktop-portal-kde
archinstall
PKGS

mkdir -p "$PROFILE/airootfs/usr/local/bin"
cp -a "$ROOT/profile/airootfs/usr/local/bin/." "$PROFILE/airootfs/usr/local/bin/"
chmod +x "$PROFILE/airootfs/usr/local/bin/"*

sed -i 's/^iso_name=.*/iso_name="gamelinux"/' "$PROFILE/profiledef.sh"
sed -i 's/^iso_label=.*/iso_label="GAMELINUX"/' "$PROFILE/profiledef.sh"
sed -i 's/^iso_publisher=.*/iso_publisher="GameLinux"/' "$PROFILE/profiledef.sh"
sed -i 's/^iso_application=.*/iso_application="GameLinux Gaming Linux"/' "$PROFILE/profiledef.sh"

mkarchiso -v -w "$WORK" -o "$OUT" "$PROFILE"

echo "ISO créée:"
ls -lh "$OUT"/gamelinux*.iso
sha256sum "$OUT"/gamelinux*.iso
