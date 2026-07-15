# theme.nix : colonne vertébrale colorimétrique, sélection par variant.
#
# `variant` est le SEUL knob qui retourne toute la machine :
#   "blood"   -> near-black + plum-rose sourd (défaut)
#   "copland" -> ambre chaud, tube CRT copland-os (serial experiments lain)
#
# `mauve` est le SLOT accent — or en copland, plum-rose en blood — pas une couleur fixe.
# les deux palettes partagent les mêmes 26 clés sémantiques (convention catppuccin) par contrat,
# donc tout consommateur qui interpole `theme.palette.<clé>` se rethème automatiquement.
#
# importé une fois dans flake.nix et threadé partout comme specialArg `theme`.
let
  variant = "blood"; # "blood" | "copland"

  palettes = {
    # copland amber : le tube tachibana labs / copland os. ambre chaud sur noir chaud,
    # un CRT phosphore-P1 analogique. la luminosité porte la hiérarchie, pas la teinte ;
    # rust-red est le seul contraste (erreurs), jaune-vert chaud = « la machine a répondu ».
    copland = {
      rosewater = "#e8d2a8";
      flamingo = "#e0b890";
      pink = "#e0a890";
      mauve = "#ffc24d"; # ACCENT : or vif
      red = "#d9442f"; # rust-red, erreurs / seul contraste
      maroon = "#e85a3a";
      peach = "#e89a4a"; # orange chaud
      yellow = "#f0c860"; # ambre-jaune, avertissements
      green = "#b9c46a"; # jaune-vert chaud, succès
      teal = "#9ab884";
      sky = "#d6bd72";
      sapphire = "#c8a850";
      blue = "#c89a58"; # tan chaud, pas de bleu dans le monde ambre
      lavender = "#d8bd84";
      text = "#d8b25a"; # ambre fg
      subtext1 = "#c4a050";
      subtext0 = "#8a6e34"; # dim
      overlay2 = "#705a28";
      overlay1 = "#5c4a22"; # commentaires
      overlay0 = "#4a3c1c";
      surface2 = "#382e18";
      surface1 = "#28200f"; # sélection / bordure inactive
      surface0 = "#1a1610"; # surface
      base = "#0b0a07"; # bg, noir chaud
      mantle = "#080704";
      crust = "#050402";
    };

    # blood & static (défaut) : near-black avec un accent plum/wine sourd,
    # texte gris-violet doux. atténué depuis le crimson pour rester moody et lain,
    # pas alarmant ; l'accent reste lisible sur la barre sombre.
    # red est réservé aux vraies erreurs.
    blood = {
      rosewater = "#d8ccd4";
      flamingo = "#c8aab8";
      pink = "#c79ab4";
      mauve = "#bf7593"; # ACCENT : plum-rose sourd, prompt/liens/actif
      red = "#c0667e"; # rose-red sourd, erreurs uniquement
      maroon = "#d07e96";
      peach = "#b07e90"; # mauve-pêche sourd
      yellow = "#c4a878"; # ambre sourd, avertissements
      green = "#82a08c"; # sauge sourd, succès
      teal = "#6f9a98";
      sky = "#8c8aa6";
      sapphire = "#9a72a0";
      blue = "#8a7aa6"; # violet-bleu sourd, mots-clés / dossiers / structure
      lavender = "#b09cc0";
      text = "#c2b6c0"; # gris-violet doux fg
      subtext1 = "#a89ca6";
      subtext0 = "#948a98"; # dim mais lisible
      overlay2 = "#6e6470";
      overlay1 = "#4c4450"; # commentaires
      overlay0 = "#3c3442";
      surface2 = "#2a2430";
      surface1 = "#1e1824"; # sélection / bordure inactive
      surface0 = "#151019"; # surface
      base = "#0d0a0e"; # bg, near-black, pointe de violet
      mantle = "#0a070b";
      crust = "#060406";
    };
  };

  # les 16 couleurs ANSI par variant (index 0..15 : black, red, green, yellow, blue,
  # magenta, cyan, white, puis les 8 bright).
  terminal16 = {
    copland = [
      "#28200f"
      "#d9442f"
      "#b9c46a"
      "#f0c860"
      "#c89a58"
      "#e0a06a"
      "#d8b25a"
      "#e8c88a"
      "#5c4a22"
      "#e85a3a"
      "#cdd47a"
      "#ffd870"
      "#e0b070"
      "#f0b888"
      "#ecc888"
      "#f7ecca"
    ];
    blood = [
      "#1e1824"
      "#c0667e"
      "#82a08c"
      "#c4a878"
      "#8a7aa6"
      "#bf7593"
      "#6f9a98"
      "#c2b6c0"
      "#4c4450"
      "#d07e96"
      "#9ab4a2"
      "#d4bc90"
      "#a08cc0"
      "#cf90ac"
      "#8ab4b0"
      "#e0d6dc"
    ];
  };

  accent = "mauve"; # le SLOT accent (or en copland, plum-rose en blood)
  palette = palettes.${variant};
in
{
  inherit variant accent palette;
  accentHex = palette.${accent};
  ansi16 = terminal16.${variant};
}
