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
}
