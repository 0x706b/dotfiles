{ isWsl, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      core.sshCommand = "ssh -T";
      user = {
        name = "Peter Krol";
        email = "peter@peterkrol.com";
      };
    };
  };
}
