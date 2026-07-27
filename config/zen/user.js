// cap zen render à 60fps pour limiter la charge gpu/compositeur au repos
// (ventilo + batterie sur le panel promotion). lu par zen à chaque démarrage,
// donc survit à la réécriture de prefs.js ; un redémarrage l'applique.
user_pref("layout.frame_rate", 60);
