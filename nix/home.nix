{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ldraney";
  home.homeDirectory = "/home/ldraney";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.package = [
	#pkgs.unzip
	pkgs.wget
]

  #zsh setup
  home.file.zshrc.source = ./zshrc
  home.file.zshrc.source = ./zshenv

  environment.binsh = "${pkgs.zsh}/bin/zsh";
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  #programs.zsh = {
    #... # Your zsh config
    #ohMyZsh = {
      #enable = true;
      #plugins = [ "git" "thefuck" ];
      #theme = "robbyrussell";
    #};
  #};
  programs.zsh = {
  enable = true;
  shellAliases = {
	lt = "echo 'hi mom'";
    update = "sudo nixos-rebuild switch";
  };
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
};
}
