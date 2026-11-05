{
  homebrew = {
    enable = true;
    prefix = "/opt/homebrew";

    # Remove unlisted packages on activation; keep upgrades explicit.
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "uninstall";
    };

    taps = [
      "daipeihust/tap"
      "hashicorp/tap"
    ];

    brews = [
      # Explicitly requested packages.
      "ansible"
      "cocoapods"
      "cryptography"
      "gh"
      "git-delta"
      "gitleaks"
      "go"
      "gradle"
      "jq"
      "lazygit"
      "lld"
      "llvm"
      "neovim"
      "node"
      "openjdk@21"
      "pdftk-java"
      "qemu"
      "ripgrep"
      "starship"
      "stow"
      "telnet"
      "tree"

      # Preserve all other installed formulae for the initial migration.
      # These can be pruned later after checking dependencies and usage.
      "brotli"
      "c-ares"
      "ca-certificates"
      "cairo"
      "capstone"
      "certifi"
      "cffi"
      "dtc"
      "expat"
      "fontconfig"
      "freetype"
      "gettext"
      "giflib"
      "glib"
      "gmp"
      "gnutls"
      "graphite2"
      "harfbuzz"
      "icu4c@76"
      "icu4c@77"
      "jpeg-turbo"
      "libevent"
      "libgit2"
      "libidn2"
      "libnghttp2"
      "libpng"
      "libslirp"
      "libsodium"
      "libssh"
      "libssh2"
      "libtasn1"
      "libtiff"
      "libunistring"
      "libusb"
      "libuv"
      "libx11"
      "libxau"
      "libxcb"
      "libxdmcp"
      "libxext"
      "libxrender"
      "libyaml"
      "little-cms2"
      "llhttp"
      "lpeg"
      "luajit"
      "luv"
      "lz4"
      "lzo"
      "mpdecimal"
      "ncurses"
      "nettle"
      "oniguruma"
      "openjdk"
      "openjdk@11"
      "openssl@3"
      "p11-kit"
      "pcre2"
      "pixman"
      "pycparser"
      "python-packaging"
      "python@3.13"
      "readline"
      # Ruby was unlinked before migration; keep that state.
      { name = "ruby"; link = false; }
      "snappy"
      "sqlite"
      "tree-sitter"
      "unbound"
      "unibilium"
      "utf8proc"
      "vde"
      "xorgproto"
      "xz"
      "z3"
      "zstd"
    ];

    casks = [
      "codex"
      "docker-desktop"
      "wezterm"
    ];
  };
}
