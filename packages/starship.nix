{ pkgs }:

with pkgs;
rustPlatform.buildRustPackage rec {
  pname = "starship";
  version = "1.11.0";

  src = fetchFromGitHub {
    owner = "starship";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-90mh8C52uD68K5o1LE22gkbL1gy6FyMJTiiN9oV/3DE=";
  };

  nativeBuildInputs = [ installShellFiles pkg-config ];

  buildInputs = [ libgit2 ] ++ lib.optionals stdenv.isDarwin (with pkgs.darwin.apple_sdk.frameworks; [ libiconv Security Foundation Cocoa ]);

  buildNoDefaultFeatures = true;
  # the "notify" feature is currently broken on darwin
  buildFeatures = if stdenv.isDarwin then [ "battery" ] else [ "default" ];

  postInstall = ''
    for shell in bash fish zsh; do
      STARSHIP_CACHE=$TMPDIR $out/bin/starship completions $shell > starship.$shell
      installShellCompletion starship.$shell
    done
  '';

  cargoSha256 = "sha256-Q1VY9RyHEsQAWRN/upeG5XJxJfrmzj5FQG6GBGrN0xU=";

  preCheck = ''
    HOME=$TMPDIR
  '';

  passthru.tests = {
    inherit (nixosTests) starship;
  };
}
