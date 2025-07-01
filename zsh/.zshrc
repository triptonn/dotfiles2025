plugins=(git zsh-completions zsh-autosuggestions venv-info virtualenv)

ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
if [[ ! -d "$ZSH_CACHE_DIR" ]]; then
  mkdir "$ZSH_CACHE_DIR"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="shibby"

source "$ZSH/oh-my-zsh.sh"
source "$ZSH/custom/themes/shibby.zsh-theme"

# export GPG Signing key(?)
# export GPG_TTY=$(tty)

# editor environment
export EDITOR='nvim'

# Pacman
alias pacman="sudo pacman"

# Shell stuff
alias update="yay -Syu"

# Virtual Environment specified python version needs to be installed on system
makevenv() {
  python$1 -m venv .venv
}

alias .venv="source .venv/bin/activate"

# Display settings profiles
# alias threeMonitors="autorandr -l three_monitor_home"

# Mounting
alias mountbackup="sudo mount -o rw,user,uid=1000,umask=007,exec --onlyonce PARTUUID=e8900690-03 $HOME/BackupHDD"
alias mountplaystation="sudo mount -o rw,user,exec --onlyonce PARTUUID=e8900690-02 $HOME/PlaystationHDD"
alias mountlinux="sudo mount -o rw,user,exec --onlyonce UUID=96DE96D1DE96A8CF $HOME/LinuxSSD"
alias mountwindows="sudo mount -o rw,user,uid=1000,umask=007,exec --onlyonce UUID=7002A4C402A490A0 $HOME/WindowsSSD"

alias umountbackup="sudo umount $HOME/BackupHDD"
alias umountplaystation="sudo umount $HOME/PlaystationHDD"
alias umountlinux="sudo umount $HOME/LinuxSSD"
alias umountwindows="sudo umount $HOME/WindowsSSD"

alias mountall="mountbackup && mountplaystation && mountlinux && mountwindows"
alias umountall="umountbackup && umountplaystation && umountlinux && umountwindows"

# AUR - yay
alias yeet="yay -Rn"
alias yeeet="yay -Rns"
alias yeet_useless="yay -Rns $(yay -Qtdq)"

# Snipping tool escrotum
alias sp="escrotum -s -C"
alias ss="escrotum -s"

# Shortcuts for VSCode
# alias scode="sudo code --no-sandbox"

# docker
docker_dev_attach() {
  docker exec -it $1 zsh
}

alias da=docker_dev_attach
alias db="docker build"

# cht.sh
alias languages="nvim $HOME/.dotfiles/tmux/.tmux/tmux-cht-languages"
alias commands="nvim $HOME/.dotfiles/tmux/.tmux/tmux-cht-command"

# tmux config
alias tmuxconf="nvim $HOME/.dotfiles/tmux/.tmux.conf"

# tmux standard sessions
alias tmux="tmux -2"
alias tmux-left="tmux -2 new -s leftyLeft"
alias tmux-main="tmux -2 new -s main"
alias tmux-right="tmux -2 new -s rightyRight"

# i3 and Polybar config shortcut
alias i3conf="nvim $HOME/.dotfiles/i3/.i3/config"
# alias polybarconf="nvim $HOME/.dotfiles/polybar/.config/polybar/config.ini"

# shell config shortcuts
alias zshrc="nvim $HOME/.dotfiles/zsh/.zshrc"
alias zshenv="nvim $HOME/.dotfiles/zsh/.zshenv"
alias bashrc="nvim $HOME/.dotfiles/bash/.bashrc"
alias vimrc="nvim $HOME/.dotfiles/vim/.vim/.vimrc"
alias sourcevimrc="cp $HOME/.dotfiles/vim/.vim/.vimrc $HOME/.dotfiles/vim/.obsidian/Yamigo/.vimrc && cd $HOME/.dotfiles && stow -S vim  && cd ~ && echo '.vimrc sourced'"

# bluetooth
# alias kh="systemctl start bluetooth.service; sudo bluetoothctl connect 00:1B:66:06:01:FF"

# ssh to pi
# alias pi="ssh quacksalber@192.168.178.39"

# sound
alias sd="pavucontrol"
alias sdmin="xdotool search --class pavucontrol windowunmap"
alias sdmax="xdotool search --class pavucontrol windowmap"

# droidcam
alias dcam="droidcam -dev=/dev/video0 -size=1280x720 &"

# Huion Tablet
alias tablet="/usr/lib/huiontablet/huiontablet.sh &"
alias huionmin="xdotool search --class huiontablet windowunmap"
alias huionmax="xdotool search --class huiontablet windowmap"

# Obsidian
alias obsidian="sudo obsidian --no-sandbox"

########################################################
# C++ Compilers
alias clangformat="nvim ~/.clang-format"

# GCC
function grooster() {
    local filename=$1
    local base_name="${filename%.*}"
    if [[ ! -d ./binaries ]]; then
        echo "Creating directory ./binaries"
        mkdir "./binaries/"
    fi
    [[ -f "./binaries/${base_name}" ]] && rm "./binaries/${base_name}"
    gcc -g -lstdc++ -std=c++20 -pedantic "${base_name}.cpp" -o "./binaries/${base_name}" -time
    timeout 2 "./binaries/${base_name}"
}

# Clang
function clrooster() {
    local filename=$1
    local base_name="${filename%.*}"
    if [[ ! -d ./binaries ]]; then
        echo "Creating directory ./binaries"
        mkdir "./binaries/"
    fi
    [[ -f "./binaries/${base_name}" ]] && rm "./binaries/${base_name}"
    clang++ -g -lstdc++ -std=c++20 -pedantic "${base_name}.cpp" -o "./binaries/${base_name}" -time
    timeout 2 "./binaries/${base_name}"
}
########################################################

# filesystem info and navigation related
alias lsb="ls -latrh"
alias lf="ls -lhF"
alias la="ls -alhF"
alias h="history|grep"
alias c="clear"
alias p=pwd

alias logout="killall -KILL -u $USER"

alias files="dolphin ."
alias help="bat ~/.zshrc | less"

# cd
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias ........="cd ../../../.."

########################################################

# functionalities

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#16161E"
bg_highlight="#292E42"
purple="#B388FF"
blue="#0A64AC"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"

tmux_open_widget() {
  $HOME/.scripts/tmux-open.sh
  zle reset-prompt
}
zle -N tmux_open_widget

export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"

# Then bind your tmux-open widget to a different key
bindkey '^Y' tmux_open_widget  # Example: Using Ctrl+Y instead

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source $HOME/.config/fzf-git/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview "eza --tree --color=always {} | head -200"                        "$@" ;;
    rm)           fzf --preview "head -200; else bat -n --color= always --line-range :500 {}; fi" "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"                                                "$@" ;;
    ssh)          fzf --preview "dig {}"                                                          "$@" ;;
    # docker is WIP
    docker)       fzf --preview "docker inspect {}"                                               "$@" ;;
    kill)         fzf --preview "ps -f -p {}"                                                     "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview"                                       "$@" ;;
  esac
}

# zsh plugins config
bindkey '^f' autosuggest-accept

# ----- Bat (better cat) -----
export BAT_THEME=OneHalfDark

# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# ---- TheFuck -----
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init --cmd cd zsh)"

