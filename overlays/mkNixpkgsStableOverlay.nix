inputs: final: _: {
  # this allows you to access `pkgs.__stable` anywhere in your config
  __stable = import inputs.nixpkgs-stable {
    inherit (final.stdenv.hostPlatform) system;
    config = {
      allowUnfree = true;
    };
  };
}
