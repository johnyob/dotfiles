# 
# Home manager has several issues around the installation of the
# dependencies for oh-my-zsh themes and plugins. The best workaround
# is to define a *custom* oh-my-zsh configuration for plugins and themes
# 
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Customization.
# 
{
  lib,
  stdenv,
}: {
  plugins ? [],
  themes ? [],
}:
stdenv.mkDerivation {
  name = "oh-my-zsh-custom";

  inherit themes;

  # No src (or srcs), so unpackPhase would fail
  dontUnpack = true;

  installPhase = ''
    pluginOutDir="$out/plugins"
    mkdir -p "$pluginOutDir"
    themeOutDir="$out/themes"
    mkdir -p "$themeOutDir"

    ${lib.concatStrings (
      map ({
        name,
        dir,
      }: ''
        cp -r "${dir}/." "$pluginOutDir/${name}/"
      '')
      plugins
    )}

    for themeDir in $themes; do
      cp -r "$themeDir/share/." "$themeOutDir/"
    done
  '';
}
