{ isWsl, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      core.sshCommand =
        if isWsl == true
        then "ssh.exe"
        else "ssh -T";
      user = {
        name = "Peter Krol";
        email = "peter@peterkrol.com";
      };
    };
  };
}
