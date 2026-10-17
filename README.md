# Kingpin Android Port

Squelette de port de Kingpin: Life of Crime (1999, moteur Quake 2) vers Android.

Voir **MUSE.md** pour les instructions complètes de finition.

## État actuel

- `game/` — source du jeu Kingpin (SDK), 55 fichiers `.c` compilent en isolation
- `game/Android.mk` — sources NDK pour `libkingpin_game.so`
- `engine/` — fork Yamagi Quake 2 avec support Android
- `game_export_t` étendu avec les 3 pointeurs Kingpin
- Header et validation `.mdx` en place
- Chemin de chargement Android pour `libkingpin_game.so`

## Limite

Un APK jouable demande un NDK, le wrapper Android, un loader `.mdx` complet, et les `.pak` du jeu. Voir MUSE.md.
