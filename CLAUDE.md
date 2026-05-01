# CLAUDE.md — repo nixos-config

> ce fichier est lu automatiquement par claude code à chaque session dans ce dossier.

## contexte

ce dépôt contient ma configuration nixos pour mon thinkpad x1 carbon gen 12 (nixos 25.11, kde plasma wayland, intel meteor lake).

je suis débutant en nix **et** j'ai un niveau basique en linux (lpi linux essentials, pas plus). l'apprentissage est piloté depuis un projet claude.ai dédié. ici, ton rôle = aide à l'édition concrète, pas pédagogie.

## comportement attendu

- réponses en français, en minuscules, sans emojis
- ne jamais modifier `hardware-configuration.nix`
- ne jamais lancer `sudo nixos-rebuild switch` sans demande explicite de ma part
- privilégier `sudo nixos-rebuild test` pour les essais (n'écrit pas dans le bootloader)
- avant toute modification, expliquer en une phrase ce que tu vas changer et pourquoi
- si tu ne connais pas avec certitude une option nixos, vérifier sur search.nixos.org plutôt que deviner

## workflow par défaut

1. je décris ce que je veux changer
2. tu m'expliques en une phrase ce qui va être modifié
3. tu fais l'édition
4. tu attends mon ok pour `sudo nixos-rebuild test`
5. on regarde le résultat
6. si ok → commit git → puis `switch` (avec mon ok)

## structure du repo

```
nixos-config/
├── CLAUDE.md
├── README.md
├── .gitignore
├── configuration.nix
└── notes.md   (optionnel, journal libre)
```

`hardware-configuration.nix` n'est volontairement pas dans le repo pour l'instant : il est spécifique à cette machine et auto-généré.

## git

- commits en français, minuscules
- format suggéré : `<scope>: <action>` (ex : `boot: ajout du support fwupd`)
- jamais `git push --force` sans demande explicite
- branche par défaut : `main`

## erreurs

- erreur de syntaxe nix : on debug ensemble, ne pas deviner
- erreur de build : lire le message au calme, identifier le module en cause
- nix-store plein : me prévenir, ne rien purger sans accord

## interdits explicites

- pas de flakes
- pas de home-manager
- pas d'overlays
- pas d'options expérimentales
- pas de modules custom
- pas d'installation de paquets via `nix-env` (utiliser `environment.systemPackages` dans la config)

ces sujets sont reportés volontairement.

## quand je débloque ces interdits

je le ferai explicitement dans une conversation, et je mettrai à jour ce fichier. tant que ce fichier dit "pas de X", tu n'introduis pas X.
