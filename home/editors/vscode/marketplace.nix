# Unfortunately pkgs.vscode-extensions is missing various extensions
# that are available in the marketplace. We need define derivations for
# these extensions manually.
{
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs) vscode-utils;
in {
  jnoortheen.nix-ide = vscode-utils.extensionFromVscodeMarketplace {
    name = "nix-ide";
    publisher = "jnoortheen";
    version = "0.3.1";
    sha256 = "sha256-05oMDHvFM/dTXB6T3rcDK3EiNG2T0tBN9Au9b+Bk7rI=";
  };
  mkhl.direnv = vscode-utils.extensionFromVscodeMarketplace {
    name = "direnv";
    publisher = "mkhl";
    version = "0.17.0";
    sha256 = "sha256-9sFcfTMeLBGw2ET1snqQ6Uk//D/vcD9AVsZfnUNrWNg=";
  };
  usernamehw.errorlens = vscode-utils.extensionFromVscodeMarketplace {
    name = "errorlens";
    publisher = "usernamehw";
    version = "3.20.0";
    sha256 = "sha256-0gCT+u6rfkEcWcdzqRdc4EosROllD/Q0TIOQ4k640j0=";
  };
  jgclark.vscode-todo-highlight = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-todo-highlight";
    publisher = "jgclark";
    version = "2.0.8";
    sha256 = "sha256-/CctaLcG+dA2Cf69/ACeDKdRLsu/VUGbAxUbyhI0VyA=";
  };
  PKief.material-icon-theme = vscode-utils.extensionFromVscodeMarketplace {
    name = "material-icon-theme";
    publisher = "PKief";
    version = "5.8.0";
    sha256 = "sha256-L16dxKXmzK7pI5E4sZ6nBXRazBbg84rp2XY9RljkEuk=";
  };
  Equinusocio.vsc-material-theme = vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "vsc-material-theme";
      publisher = "Equinusocio";
      version = "34.4.0";
      sha256 = "sha256-q5GgMVEak9KhY1LwPkIPHgz/j2AMZuz2QQWzLAKkIdU=";
    };

    # https://github.com/NixOS/nixpkgs/blob/e2dd4e18cc1c7314e24154331bae07df76eb582f/pkgs/applications/editors/vscode/extensions/equinusocio.vsc-material-theme/default.nix#L11
    prePatch = ''
      substituteInPlace ./build/core/extension-manager.js \
        --replace-fail "path_1.posix.join(extensionFolderUri.path, env_1.USER_CONFIG_FILE_NAME)" "path_1.posix.join(ExtensionContext.globalStorageUri.fsPath, env_1.USER_CONFIG_FILE_NAME)"
    '';
  };
  ms-python.python = vscode-utils.extensionFromVscodeMarketplace {
    name = "python";
    publisher = "ms-python";
    version = "2024.14.1";
    sha256 = "sha256-NhE3xATR4D6aAqIT/hToZ/qzMvZxjTmpTyDoIrdvuTE=";
  };
  ms-python.black-formatter = vscode-utils.extensionFromVscodeMarketplace {
    name = "black-formatter";
    publisher = "ms-python";
    version = "2024.2.0";
    sha256 = "sha256-qIO+YqTXjwgznzUlnPSts1R2BM6iN8B9vESkelGPgZM=";
  };
  myriad-dreamin.tinymist = vscode-utils.extensionFromVscodeMarketplace {
    name = "tinymist";
    publisher = "myriad-dreamin";
    version = "0.13.8";
    sha256 = "sha256-OB+e4lerPONs7QDqHJO3pqU1yQ3BvM2k+Tz998ibmHo=";
  };
  tomoki1207.pdf = vscode-utils.extensionFromVscodeMarketplace {
    name = "pdf";
    publisher = "tomoki1207";
    version = "1.2.2";
    sha256 = "sha256-i3Rlizbw4RtPkiEsodRJEB3AUzoqI95ohyqZ0ksROps=";
  };
  vscodevim.vim = vscode-utils.extensionFromVscodeMarketplace {
    name = "vim";
    publisher = "vscodevim";
    version = "1.28.1";
    sha256 = "sha256-cr9gP3/3kB3X8PnhdBUdR0b2ydvqr5RhiFDIZ/6hlTM=";
  };
  james-yu.latex-workshop = vscode-utils.extensionFromVscodeMarketplace {
    name = "latex-workshop";
    publisher = "James-Yu";
    version = "10.8.0";
    sha256 = "sha256-tdQ3Z/OfNH0UgpHcn8Zq5rQxoetD61dossEh8hRygew=";
  };
}
