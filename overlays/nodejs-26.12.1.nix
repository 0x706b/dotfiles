final: prev: {
  # nodejs_26 wraps nodejs-slim_26, so both use the updated source.
  nodejs-slim_26 = prev.nodejs-slim_26.overrideAttrs (finalAttrs: previousAttrs: {
    version = "26.12.1";

    src = final.fetchurl {
      url = "https://nodejs.org/dist/v${finalAttrs.version}/node-v${finalAttrs.version}.tar.xz";
      # From https://nodejs.org/dist/v26.12.1/SHASUMS256.txt
      hash = "sha256-BT47KWhZttjZP5nvl/qc7BxO4XHHKWgQDGSZeMHb04w=";
    };

    # Use Node's bundled Brotli, which includes the decoder security fix.
    configureFlags = builtins.filter (
      flag: !(final.lib.hasPrefix "--shared-brotli" flag)
    ) previousAttrs.configureFlags;

    buildInputs = builtins.filter (
      dep: final.lib.getName dep != "brotli"
    ) previousAttrs.buildInputs;

    # Keep pkg-config's system paths consistent with the remaining inputs.
    env = previousAttrs.env // {
      PKG_CONFIG_SYSTEM_INCLUDE_PATH = final.lib.makeSearchPathOutput "dev" "include" finalAttrs.buildInputs;
      PKG_CONFIG_SYSTEM_LIBRARY_PATH = final.lib.makeSearchPathOutput "dev" "lib" finalAttrs.buildInputs;
    };

    passthru = previousAttrs.passthru // {
      tests = previousAttrs.passthru.tests // {
        version = final.testers.testVersion {
          package = finalAttrs.finalPackage;
          version = "v${finalAttrs.version}";
        };
      };
    };

    meta = previousAttrs.meta // {
      changelog = "https://github.com/nodejs/node/releases/tag/v${finalAttrs.version}";
    };
  });
}
