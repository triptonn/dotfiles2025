ZSH="/usr/share/oh-my-zsh/"
export ZSH="/usr/share/oh-my-zsh/"
ZSH_THEME="robbyrussell"
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
)

ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
if [[ ! -d "$ZSH_CACHE_DIR" ]]; then
  mkdir "$ZSH_CACHE_DIR"
fi

source "$ZSH"/oh-my-zsh.sh

# PATH settings
path+=("$HOME/.local/bin/")
export PATH

# Shell stuff
alias update="yay -Syu"

# Virtual Environment
alias makevenv="sudo python3 -m venv .venv"
alias .venv="source .venv/bin/activate"

# Display settings profiles
alias threeMonitors="autorandr -l three_monitor_home; killall -q polybar; ~/.config/polybar/launch.sh"

# Mounting
alias mountbackup="sudo mount -o rw,user,uid=1000,umask=007,exec --onlyonce PARTUUID=e8900690-03 $HOME/BackupHDD"
alias mountdefault="sudo mount -o rw,user,uid=1000,umask=007,exec --onlyonce PARTUUID=e8900690-01 $HOME/old_boot_partition"
alias mountplaystation="sudo mount -o rw,user,uid=1000,umask=007,exec --onlyonce PARTUUID=e8900690-02 $HOME/PlaystationHDD"
alias mountdata="sudo mount -o rw,user,uid=1000,umask=007,exec --onlyonce PARTUUID=f1b9ac82-3f9d-4026-b0d3-b7e59c34a9af $HOME/DataSSD"
alias mountdataf="sudo mount -o rw,user,exec --onlyonce UUID=371d8a28-bcbc-4efb-a715-3884851826dd $HOME/DataNVME"
alias mountwindows="sudo mount -o rw,user,uid=1000,umask=007,exec --onlyonce UUID=0F76318F6A366E58 $HOME/WindowsSSD"

# AUR - yay
alias yeet="yay -Rn"
alias yeeet="yay -Rns"
alias yeet_useless="yay -Rns $(yay -Qtdq)"

# Snipping tool escrotum
alias sp="escrotum -s -C"
alias ss="escrotum -s"

# Shortcuts for VSCode
alias scode="sudo code --no-sandbox"

# docker



# cht.sh
alias languages="nvim $HOME/.tmux/tmux-cht-languages"
alias commands="nvim $HOME/.tmux/tmux-cht-command"

# tmux standard sessions
alias tmux-left="tmux new -s leftyLeft"
alias tmux-main="tmux new -s main"
alias tmux-right="tmux new -s rightyRight"

# i3 and Polybar config shortcut
alias i3conf="nvim $HOME/.config/i3/config"
alias pbleft="nvim $HOME/.config/polybar/config-left.ini"
alias pbmid="nvim $HOME/.config/polybar/config-middle.ini"
alias pbright="nvim $HOME/.config/polybar/config-right.ini"

# shell config shortcuts
alias zshrc="nvim $HOME/.zshrc"
alias bshrc="nvim $HOME/.bshrc"
alias tmuxconf="nvim $HOME/.tmux.conf"
alias i3conf="nvim $HOME/.config/i3/config"

# shell runcom's 
alias grooster="rm grooster; gcc -g -lstdc++ -std=c++20 -pedantic ./*.cpp -o ./grooster -time; timeout 2 ./grooster"
alias clrooster="rm clrooster; clang++ -g -lstdc++ -std=c++20 -pedantic ./*.cpp -o ./clrooster; timeout 2 ./clrooster"

# bluetooth
alias kh="systemctl start bluetooth.service; sudo bluetoothctl connect 00:1B:66:06:01:FF"

# ssh to pi
alias pi="ssh quacksalber@192.168.178.39"

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

# git
alias g="git"
alias gad="git add --all"
alias gcm="git commit -m"
alias gcms="git commit -S -m"
alias gph="git push"
alias gpl="git pull"
alias gcl="git clone"
alias gin="git init"

alias gst="git status"
alias glg="git log -n 5"
alias glgr="git reflog"
alias gdf="git diff"

alias gbr="git branch"
alias gsw="git switch"
alias gch="git checkout"
alias gra="git remote add origin git@github.com:"
alias grs="git remote set-url origin git@github.com:"

# other
alias lsb="ls -latrh"
alias lf="ls -lF"
alias la="ls -alF"
alias h="history|grep"
alias c="clear" # I know about ctrl l etc.
alias logout="killall -KILL -u $USER"
alias files="nemo"
alias files.="nemo ."
alias help="cat ~/.zshrc | less"

# cd
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
alias ........="cd ../../../.."

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
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

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

source $HOME/.scripts/fzf-git.sh

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
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# zsh plugins config
bindkey '^f' autosuggest-accept


# ----- Bat (better cat) -----

export BAT_THEME=GitHub

# ---- Eza (better ls) -----

alias ls="eza --icons=always"

# ---- TheFuck -----

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init --cmd cd zsh)"

