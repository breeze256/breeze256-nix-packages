{ stdenv
, fetchFromGitHub
, lib
, ...
} @ args:

################################################################################
# Based on the GitHub repository:
# https://github.com/TheGreatMcPain/gruvbox-material-gtk
################################################################################

stdenv.mkDerivation rec {
  pname = "gruvbox-material-gtk";
  version = "2023-08-28";
  src = fetchFromGitHub ({
    owner = "TheGreatMcPain";
    repo = "gruvbox-material-gtk";
    # commit id
    rev = "a1295d8bcd4dfbd0cd6793d7b1583b442438ed89";
    fetchSubmodules = false;
    # 这里的 SHA256 校验码不会算怎么办？先注释掉，然后构建这个软件包，Nix 会报错，并提示你正确的校验码
    # sha256 = "sha256-m20M4+3zsH40hTpMJG9cyIjXp0xcCUBS+cCiRVLXFqM=";
  });

  # Run install script
  installPhase = ''
    cp -r themes/* $out/share/themes
    cp -r icons/* $out/share/icons
  '';
}