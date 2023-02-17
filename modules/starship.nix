{ pkgs }:

with pkgs;
rustPlatform.buildRustPackage rec {
  pname = "starship";
  version = "1.11.0";

  src = fetchFromGitHub {
    owner = "starship";
    repo = pname;
    rev = "v${version}";
    sha256 = "0cfwgy2zd3989q4j65xs1kbcnil2nr6jqdcs5fy3xf3n5vqa2jgp";
  };

  nativeBuildInputs = [ installShellFiles pkg-config cmake ];

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
