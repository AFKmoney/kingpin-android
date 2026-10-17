# MUSE.md — Comment finir le port Kingpin Android

Ce dépôt est un squelette. Le module de jeu compile. Le moteur reconnaît les fichiers `.mdx`. Il manque le build Android, le rendu des modèles et les données.

## État actuel

- `game/` : 55 fichiers `.c` du SDK Kingpin. Compilent avec `gcc -I. -I../engine/src/game/header -c *.c`.
- `game/Android.mk` : liste complète des sources pour NDK (`kingpin_game` → `libkingpin_game.so`).
- `engine/src/game/header/game.h` : `game_export_t` étendu avec `GetNumObjectBounds`, `GetObjectBoundsPointer`, `GetNumJuniors`.
- `engine/src/backends/unix/system.c` : chemin Android pour `libkingpin_game.so` quand `getGameType() == 100`.
- `engine/src/common/header/files.h` : définition `mdx_header_t` (magic `IDPX`, version 4).
- `engine/src/client/refresh/files/models.c` : `Mod_LoadMDX` valide le header.
- Renderers (`gl1`, `gl3`, `soft`) : dispatch `MDXHEADER` → `Mod_LoadMDX`.

## Ce qu'il faut pour un APK jouable

### 1. Environnement Android

Le port Yamagi Android (`emileb/yquake2`) dépend de la couche OpenTouch (SDL, `getGameType`, `nativeLibsPath`). Cette couche n'est pas dans ce dépôt.

- Installer le NDK Android.
- Récupérer ou reconstruire le projet Android parent qui appelle `ndk-build` et charge les `.so`.
- Ou partir d'un port Quake 2 Android existant (FTEDroid, Quake2Android) et y injecter le module Kingpin.

### 2. Charger le module de jeu

Dans `engine/src/backends/unix/system.c`, le code Android charge une lib selon `getGameType()`. Le cas Kingpin est déjà présent :

```c
else if( getGameType() == 100 )
{
    gamename = "libkingpin_game.so";
}
```

Il faut que le wrapper Android renvoie `100` (ou un enum dédié) et que `libkingpin_game.so` soit dans le chemin de recherche natif.

### 3. Rendu des modèles `.mdx`

Le loader actuel valide le header et s'arrête. Pour dessiner :

- Extraire frames, triangles, GL commands et sub-objects selon la spec (https://kingpin.info/?p=mdx).
- Ou intégrer le système de modèles de `yquake2remaster` qui a un support expérimental `.mdx`.
- Brancher le résultat sur le pipeline de rendu existant.

Sans ça, les modèles ne s'affichent pas.

### 4. Données du jeu

Les `.pak` Kingpin ne sont pas inclus. Copier une installation légale dans le dossier de données du port.

### 5. Build

```bash
cd game
gcc -I. -I../engine/src/game/header -c *.c
```

Le `Android.mk` du module est prêt. Le moteur a besoin des mêmes libs que le port Yamagi Android.

## Ordre de travail

1. Faire builder le port Yamagi Android de base.
2. Compiler `libkingpin_game.so` et le faire charger via `getGameType() == 100`.
3. Ajouter l'extraction géométrique `.mdx` ou intégrer le loader du remaster.
4. Placer les `.pak` et tester.

Le code du jeu est compilable. Le reste est de l'intégration et des données.
