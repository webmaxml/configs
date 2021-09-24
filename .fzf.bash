# Setup fzf
# ---------
if [[ ! "$PATH" == */home/webmaxml/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/webmaxml/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/webmaxml/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/webmaxml/.fzf/shell/key-bindings.bash"

# Default command "fzf" which invokes without STDIN pipe
export FZF_DEFAULT_COMMAND='fdfind --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# CTRL+T command, which is used to paste selected files/dirs onto the command-line
export FZF_CTRL_T_COMMAND='fdfind --hidden --follow --exclude .git'

# ALT+C commsnd, which is used to cd into selected directory
export FZF_ALT_C_COMMAND='fdfind --type d --hidden --follow --exclude .git'

# for files completion - vim **<TAB>
_fzf_compgen_path() {
  fdfind --hidden --follow --exclude ".git" . "$1"
}

# for directory completion - cd **<TAB>
_fzf_compgen_dir() {
  fdfind --type d --hidden --follow --exclude ".git" . "$1"
}
