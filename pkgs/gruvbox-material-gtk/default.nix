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
    # SHA256
    sha256 = "sha256-VumO8F4ZrFI6GZU1XXaw4MCnP+Nla1rVS3uuSUzpl9E=";
  });

  # Run install script
  installPhase = ''
    mkdir -p $out/share/themes $out/share/icons
    cp -r themes/* $out/share/themes/
    cp -r icons/* $out/share/icons/
  '';
}