if status is-interactive
    # Commands to run in interactive sessions can go here
end

#-------------------------------RUN ON LAUNCH------------------------------------
ufetch-arch | lolcat
faillock --reset --user $USER
starship init fish | source

#-------------------------------FISH GREETING MESSAGE-----------------------------

###--supress-old-fish-message--###
set fish_greeting ''

###--new-colorful-kitty-message--###
toilet -f term '***Welcome to the Alacritty Terminal***' -d /usr/share/figlet/fonts/ -t -F border --rainbow

#-----------------------------------------ALIASES-----------------------------------------

###--term-cmd-apps--###

alias find fd
alias ls "exa -lah --icons"
alias grep rg
alias cat bat
alias sudo "doas --"

###--system-update-aliases--###

alias update "mirrorup & pupd & aupd"
alias onlyupd "aupd & pupd"

###--pacman-aliases--###

alias pupd "sudo pacman -Syu"
alias psync "sudo pacman -Sy"
alias pinstall "sudo pacman -S"
alias pinfo "sudo pacman -Si"
alias psearch "sudo pacman -Ss"
alias cache "sudo paccache -r -f"

###--paru-aliases--###

alias aupd "paru -Syu"
alias async "paru -Sy"
alias ainstall "paru -S"
alias ainfo "paru -Si"
alias asearch "paru -Ss"
alias remove "paru -Qtdq | paru -Rns -"

###--git-aliases--###
alias ginit "git init"
alias gpull "git pull"
alias gadd "git add"
alias gcommit "git commit -m"
alias gpush "git push"
alias gstat "git status"
alias gdiff "git diff"
alias glog "git log -p"

###--general--###
alias rm "rm -rf"
alias cp "cp -r"
alias mkdir "mkdir -p"
alias .. "cd .."
alias brtctl "sudo brightnessctl set"
alias cpd "lms cp"
alias rmd "lms rm"
alias mvd "lms sync"

###--nodejs-aliases--###
alias nd "nodemon -e js,env,html,hbs,css,cert"

###--rkhunter-aliases--###
alias rkchk "sudo rkhunter -c --sk"
alias rklog "sudo cat /var/log/rkhunter.log"
alias rkupd "sudo rkhunter --update"

###--systemctl-aliases--###
alias renable "sudo systemctl enable"
alias rstart "sudo systemctl start"
alias rstatus "sudo systemctl status"
alias rstop "sudo systemctl stop"
alias uenable "systemctl enable --user"
alias ustatus "systemctl status --user"
alias ustart "systemctl start --user"
alias ustop "systemctl stop --user"

###--journalctl-aliases--###
alias errs "journalctl -p 3 -b"

###--snapper-aliases--###
alias lssnaphome "sudo snapper -c home list"
alias lssnaproot "sudo snapper -c root list"
alias snaphome "sudo snapper -c home -c"
alias snaproot "sudo snapper -c root -c"

###--reflector-aliases--###
alias mirrorup "sudo reflector --save /etc/pacman.d/mirrorlist -a 48 -l 20 -f 5 --sort rate"

###--dotfiles-management-aliases--###
alias config '/usr/bin/git --git-dir=/home/destruct/.cfg/ --work-tree=/home/destruct'
alias config '/usr/bin/git --git-dir=/run/media/destruct/39568688-b38c-43ac-a7de-c0f9888ec0c0/git-repos/dotfiles.git/ --work-tree=/home/destruct'

#--------------------------------------FUNCTIONS--------------------------------------------

###--vterm-shell-side-config--###
function vterm_printf
    if begin
            [ -n "$TMUX" ]; and string match -q -r "screen|tmux" "$TERM"
        end
        # tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

###--vterm-clear-scrollback--###
if [ "$INSIDE_EMACS" = vterm ]
    function clear
        vterm_printf "51;Evterm-clear-scrollback"
        tput clear
    end
end
