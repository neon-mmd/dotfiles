#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

#---------------------------RUN ON LAUNCH----------------------------------------
ufetch-arch | lolcat
faillock --reset --user $USER
eval "$(starship init bash)"

#-------------------------------BASH GREETING MESSAGE-----------------------------

###--new-colorful-kitty-message--###
toilet -f term '***Welcome to the Kitty Terminal***' -d /usr/share/figlet/fonts/ -t -F border --rainbow

#-----------------------------------------ALIASES-----------------------------------------

###--term-cmd-apps--###

alias find=fd
alias ls="exa -alh --group-directories-first --icons --git"
alias grep=rg
alias cat=bat
# alias sudo="doas --"
alias vim="nvim"
alias tree="exa -a --tree --icons --group-directories-first"

###--system-update-aliases--###

alias update="mirrorup && pupd && aupd && cache"
alias onlyupd="aupd && pupd"

###--pacman-aliases--###

alias pupd="sudo pacman -Syu --overwrite=\* --ask 4"
alias psync="sudo pacman -Sy"
alias pinstall="sudo pacman -Sy --overwrite=\*"
alias pinfo="pacman -Si"
alias psearch="pacman -Ss"
alias cache="sudo paccache -rf"
alias pkgls="pacman -Qq"
alias pkgcnt="pacman -Qq | wc -l"

###--paru-aliases--###
alias aupd="paru -Su --overwrite=\* --ask 4"
alias ainstall="paru -S --overwrite=\*" 
alias ainfo="paru -Si"
alias asearch="paru -Ss"
alias remove="paru -Qtdq | paru -Rns -"

###--git-aliases--###
alias ginit="git init"
alias gpull="git pull"
alias gadd="git add"
alias gcommit="git commit -m"
alias gpush="git push"
alias gstat="git status"
alias gdiff="git diff"
alias glog="git log -p"

###--general--###
alias rm="rm -rf"
alias cp="cp -r"
alias mkdir="mkdir -p"
alias ..="cd .."
alias brtctl="sudo brightnessctl set"
alias cpd="lms cp"
alias rmd="lms rm"
alias mvd="lms sync"

###--nodejs-aliases--###
alias nd="nodemon -e js,env,html,hbs,css,cert"

###--rkhunter-aliases--###
alias rkchk="sudo rkhunter -c --sk"
alias rklog="sudo cat /var/log/rkhunter.log"
alias rkupd="sudo rkhunter --update"

###--systemd-aliases--###
alias renable="sudo systemctl enable"
alias rdisable="sudo systemctl disable"
alias rstart="sudo systemctl start"
alias rrestart="sudo systemctl restart"
alias rstatus="sudo systemctl status"
alias rstop="sudo systemctl stop"
alias uenable="systemctl enable --user"
alias udisable="systemctl disable --user"
alias ustatus="systemctl status --user"
alias ustart="systemctl start --user"
alias urestart="systemctl restart --user"
alias ustop="systemctl stop --user"

###--journalctl-aliases--###
alias errs="journalctl -p 3 -b"

###--snapper-aliases--###
alias lssnaphome="sudo snapper -c home list"
alias lssnaproot="sudo snapper -c root list"
alias snaphome="sudo snapper -c home -c"
alias snaproot="sudo snapper -c root -c"

###--reflector-aliases--###
alias mirrorup="sudo reflector --save /etc/pacman.d/mirrorlist -a 48 -l 20 -f 5 --sort rate"

###--dotfiles-management-aliases--###
alias config='/usr/bin/git --git-dir=/home/destruct/.cfg/ --work-tree=/home/destruct'
alias config='/usr/bin/git --git-dir=/run/media/destruct/39568688-b38c-43ac-a7de-c0f9888ec0c0/git-repos/dotfiles.git/ --work-tree=/home/destruct'

###--kitty-kittens-aliases--###
alias img="kitty +kitten icat"

#--------------------------------------FUNCTIONS--------------------------------------------

vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    function clear(){
        vterm_printf "51;Evterm-clear-scrollback";
        tput clear;
    }
fi

#-------------------------------------COMPLETIONS--------------------------------------------

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#--------------------------------------Vim-mode----------------------------------------------
set -o vi
