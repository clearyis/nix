{ ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "ComicCodeLigatures Nerd Font", "Caskaydia Mono Nerd Font" ];
    };
  };
}
