function fish_user_key_bindings
bind --mode insert ctrl-p 'history-search-backward'
bind --mode insert ctrl-n 'history-search-forward'
bind --mode insert ctrl-y 'accept-autosuggestion'
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x EDITOR "nvim"
set -x MANPAGER "nvim +Man!"

abbr -a cd "z"
abbr -a vi "nvim"
abbr -a vim "nvim"
abbr -a ls "eza --icons --group-directories-first --git"
abbr -a la "eza -ghla --icons --group-directories-first --git"
abbr -a lt "eza -ghl --group-directories-first --git --tree --level=2"
abbr -a cat "bat"
abbr -a grep "rg"
abbr -a find "fd"
abbr -a du "dust --reverse"
abbr -a cu "checkupdates"
abbr -a ff "fastfetch"
abbr -a ns "nordvpn status"
abbr -a nc "nordvpn connect"
abbr -a nd "nordvpn disconnect"
abbr -a :q "exit"
abbr -a wttr "curl wttr.in/75098\?u"
#abbr -a cddev "z /run/media/esh/7CC2B57255551CB8/dev"
abbr -a cdpoe "z /home/esh/.steam/root/steamapps/compatdata/238960/pfx/drive_c/users/steamuser/My\\ Documents/My\\ Games/Path\\ of\\ Exile"
abbr -a cdpoe2 "z /home/esh/.steam/root/steamapps/compatdata/2694490/pfx/drive_c/users/steamuser/My\\ Documents/My\\ Games/Path\\ of\\ Exile\\ 2"
abbr -a reflect "sudo reflector --verbose --country US --threads 10 --latest 100 --score 20 --sort rate --save /etc/pacman.d/mirrorlist"

starship init fish | source
zoxide init fish | source
# Set up fzf key bindings
fzf --fish | source
#bass source ~/.gvm/environments/default
fish_add_path "/home/esh/.cargo/bin"
fish_add_path "go/bin"
