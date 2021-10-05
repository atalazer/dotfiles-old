{ config, pkgs, home-manager, ... }:
let
  link = path:
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/.dotfiles/${path}";
in
{
  home.packages = with pkgs; [
    tmux
    # tmuxp
    ];
  home.file = { 
    ".config/tmux/tmux.conf".source = link "configs/cli/tmux/tmux.conf";
    ".config/tmuxp".source = link "configs/cli/tmuxp";
    ".config/smug".source = link "configs/cli/smug";
  };

  programs.tmux = {
    enable = false;
    clock24 = true;
    sensibleOnTop = false;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 100000;
    terminal = "xterm-256color";
    keyMode = "vi";
    shortcut = "a";
    prefix = "C-a";
    extraConfig = ''
      ### Global Settings ###
      set -ga terminal-overrides ",*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'

      set -g mouse on
      set -g focus-events on
      set -g history-file ~/.tmux/log/tmuxhistory

      set -g monitor-activity off
      set -g visual-activity off
      setw -g monitor-bell off
      set -g bell-action none

      set -g set-clipboard on
      setw -g wrap-search off

      ### Appearance ###
      set -g status on
      set -g status-position bottom
      set -g status-bg default
      set -g status-interval 5
      set -g status-style "fg=black, bg=default"

      set -g status-left-length 50
      set -g status-left "#[fg=blue,bg=default]   #(whoami)"
      set -g status-justify centre
      set -g window-status-format "#[fg=white,bg=default] #I #W "
      set -g window-status-current-format "#[fg=blue,bg=default, bold] #I #W "
      set -g window-status-separator "#[fg=brightblack,bg=default]|"
      set -g status-right-length 50
      set -g status-right "#{prefix_highlight} #[fg=blue,bg=default]   #(lsb_release -d | cut -f 2) "

      setw -g automatic-rename on
      setw -g allow-rename on
      set -g renumber-windows on
      set -g set-titles on
      set -g set-titles-string "#{pane_current_command}"
      set -g window-style "fg=white bg=default"
      set -g window-active-style "fg=white bg=default"
      setw -g mode-style "fg=blue, bg=default"
      set -g message-style "fg=blue, bg=default"

      # ### Keybindings ###
      bind-key r source-file ~/.config/tmux/tmux.conf \; display-message "tmux config reloaded"

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

      bind-key -n Home    send Escape "OH"
      bind-key -n End     send Escape "OF"
    '';
    plugins = with pkgs.tmuxPlugins; [
      yank
      copycat
      {
        plugin = tmux-fzf;
        extraConfig = ''
        # TMUX_FZF_OPTIONS="-p -w 60% -h 40% -m"
        # TMUX_FZF_PREVIEW=1
        # TMUX_FZF_ORDER="session|window|pane|command|keybinding|clipboard|process"
        TMUX_FZF_LAUNCH_KEY="C-f"
        '';
      }
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];
  };
}
