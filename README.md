# GameLinux

GameLinux est une distribution Linux x86_64 orientée jeu vidéo, construite avec Archiso.

## Contenu
- Linux Zen
- Mesa + Vulkan
- Steam / Proton
- Gamescope
- GameMode
- MangoHud
- Wine / Winetricks / Protontricks
- PipeWire / WirePlumber
- KDE Plasma + Wayland
- NetworkManager
- installateur UEFI
- diagnostic matériel et Vulkan

## Construire l'ISO

Le build doit être lancé sur Arch Linux x86_64 connecté à Internet.

```bash
git clone https://github.com/piomonin/GameLinux.git
cd GameLinux
chmod +x build-iso.sh
sudo ./build-iso.sh
```

L'ISO sera créée dans `out/`.

## Installer

1. Écrire l'ISO sur une clé USB avec Rufus.
2. Démarrer le PC en UEFI.
3. Dans GameLinux, lancer:

```bash
gamelinux-install
```

**Attention : le disque choisi par l'installateur est entièrement effacé.**

Après le premier démarrage:

```bash
gamelinux-diagnose
vulkaninfo --summary
```

## Dépannage

Si quelque chose ne fonctionne pas, envoie:

```bash
gamelinux-diagnose
```

avec le nom du jeu, le GPU et l'erreur affichée.

## Licence

MIT.
