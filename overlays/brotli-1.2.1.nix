final: prev: {
  # Includes the decoder security fix required by Node.js 24.22.1 and 26.12.1.
  brotli = prev.brotli.overrideAttrs (finalAttrs: _previousAttrs: {
    version = "1.2.1";

    src = final.fetchFromGitHub {
      owner = "google";
      repo = "brotli";
      tag = "v${finalAttrs.version}";
      hash = "sha256-llY72cYffDv0ugsH0p89xIPEbElV4L8u7U/Fe8hT3gI=";
    };
  });
}
