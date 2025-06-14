{
  lib,
  stdenv,
  fetchFromGitHub,
  nix-update-script,
  pkg-config,
  meson,
  ninja,
  vala,
  desktop-file-utils,
  libcanberra,
  gtk3,
  glib,
  libgee,
  libhandy,
  libportal-gtk3,
  granite,
  pango,
  sqlite,
  zeitgeist,
  libcloudproviders,
  libgit2-glib,
  wrapGAppsHook3,
  systemd,
}:

stdenv.mkDerivation rec {
  pname = "elementary-files";
  version = "7.1.2";

  outputs = [
    "out"
    "dev"
  ];

  src = fetchFromGitHub {
    owner = "elementary";
    repo = "files";
    rev = version;
    hash = "sha256-7K9XXTXQMoHGV7yI23Gtbw7R1NRyQgFO45haXHAuUxw=";
  };

  nativeBuildInputs = [
    desktop-file-utils
    meson
    ninja
    pkg-config
    vala
    wrapGAppsHook3
  ];

  buildInputs = [
    glib
    granite
    gtk3
    libcanberra
    libcloudproviders
    libgee
    libgit2-glib
    libhandy
    libportal-gtk3
    pango
    sqlite
    systemd
    zeitgeist
  ];

  passthru = {
    updateScript = nix-update-script { };
  };

  meta = with lib; {
    description = "File browser designed for elementary OS";
    homepage = "https://github.com/elementary/files";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    teams = [ teams.pantheon ];
    mainProgram = "io.elementary.files";
  };
}
