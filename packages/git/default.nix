{ isWsl, ... }:
{
  programs.git = {
    enable = true;
    userName = "Peter Krol";
    userEmail = "peter@peterkrol.com";
    # extraConfig = {
    #   core.sshCommand =
    #     if isWsl == true
    #     then "ssh.exe"
    #     else "ssh";
    # };
  };
}
