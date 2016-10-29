
if [[ -z $DOTPATH ]]; then
  _get_dotpath() {
    local d
    d="${0:A:h}"
    if [[ $d =~ dotfiles$ ]]; then
      echo "$d"
    else
      return 1
    fi
  }
  export DOTPATH="$(_get_dotpath)"
  unfunction _get_dotpath
fi

# Editor
export EDITOR=vim
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ls command colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

setopt no_global_rcs
# Add ~/bin to PATH
export PATH=~/bin:"$PATH"
export PATH="/usr/local/bin:$PATH:/usr/local/sbin"

# History file and its size
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

