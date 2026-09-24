# Installation GameLinux

## Construire

Sur Arch Linux x86_64:

```bash
git clone https://github.com/piomonin/GameLinux.git
cd GameLinux
chmod +x build-iso.sh
sudo ./build-iso.sh
```

## USB

Avec Rufus sous Windows:
1. choisir `out/gamelinux-*.iso`;
2. choisir la clé USB;
3. démarrer le PC en UEFI.

## Installation

Dans le Live ISO:

```bash
gamelinux-install
```

Le disque sélectionné est effacé. L'installateur demande explicitement `EFFACER`.

## Premier démarrage

```bash
gamelinux-diagnose
vulkaninfo --summary
```

## Dépannage

### Écran noir
```text
Ctrl+Alt+F3
```

Puis:

```bash
lspci -k | grep -EA3 'VGA|3D|Display'
```

### Audio
```bash
systemctl --user status pipewire wireplumber pipewire-pulse
wpctl status
```

### Réseau
```bash
nmcli device status
```

### Jeu qui ne démarre pas
```bash
gamelinux-diagnose
```

Envoie ensuite la sortie, le nom du jeu, le GPU et l'erreur.
