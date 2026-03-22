{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "pragmata-pro";
  version = "0.903";
  src = font/PragmataProW-2eax9x-xvcc2m.zip;
  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src
    for file in PragmataPro${version}W/*.woff2; do
      ${pkgs.woff2}/bin/woff2_decompress "$file";
    done
    runHook postUnpack
  '';
  installPhase = ''
    runHook preInstall
    install -Dm644 PragmataPro${version}W/*.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';
}
