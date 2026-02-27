# vim:ft=zplug

has_plugin() {
  (( $+functions[zplug] )) || return 1
  zplug check "${1:?too few arguments}"
  return $status
}
# Local loading
zplug "zplug/zplug"

zplug "~/.modules", \
  from:local, \
  defer:1, \
  use:"*.sh"

zplug "~/.zsh", \
  from:local, \
  defer:2, \
  use:"<->_*.zsh"

zplug "b4b4r07/zsh-gomi", \
  as:command, \
  use:bin/gomi

zplug "mrowa44/emojify", \
  as:command

if ! command -v jq >/dev/null 2>&1; then
  zplug "stedolan/jq", \
    as:command, \
    from:gh-r
fi
if ! command -v fzf >/dev/null 2>&1; then
  zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf"
fi
if ! command -v pt >/dev/null 2>&1; then
  zplug "monochromegane/the_platinum_searcher", \
    as:command, \
    from:gh-r, \
    rename-to:"pt"
fi
if ! command -v peco >/dev/null 2>&1; then
  zplug "peco/peco", \
    as:command, \
    from:gh-r
fi
if ! command -v ghq >/dev/null 2>&1; then
  zplug "motemen/ghq", \
    as:command, \
    from:gh-r
fi

zplug "b4b4r07/ls.zsh", \
  as:command, \
  use:bin/ls

zplug "b4b4r07/emoji-cli", \
  if:'(( $+commands[jq] ))', \
    on:"junegunn/fzf-bin"

zplug "b4b4r07/enhancd", \
  use:init.sh

zplug "glidenote/hub-zsh-completion"

zplug "b4b4r07/zsh-vimode-visual", \
  use:"*.sh"

zplug "zsh-users/zsh-completions"

zplug "zsh-users/zsh-history-substring-search"

zplug "zsh-users/zsh-syntax-highlighting", \
  defer:3

zplug "b4b4r07/peco-tmux.sh", \
  as:command, \
  use:'*.sh', \
  rename-to:'peco-tmux'

zplug "time-less-ness/distribution", \
  as:command, \
  use:distribution, \
  if:'(( $+commands[perl] ))'

if ! command -v nssh >/dev/null 2>&1; then
  zplug "fujiwara/nssh", \
    as:command, \
    from:gh-r, \
    rename-to:"nssh"
fi

zplug "wg/wrk", \
  as:command, \
  hook-build:"make"

zplug "reorx/httpstat", \
  as:command, \
  use:'httpstat.py', \
  if:'(( $+commands[python] ))', \
    rename-to:'httpstat'

zplug "takuya/f5a6fb560dc357835122", \
  as:command, \
  from:gist, \
  use:'node2bash.js', \
  rename-to:'node2bash'

if ! command -v battery >/dev/null 2>&1; then
  zplug 'Code-Hex/battery', as:command, from:gh-r
fi