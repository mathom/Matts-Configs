if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

short_dir() {
  local sep count dir end result
  if [[ "$PWD" == "$HOME" ]]; then
    echo -n "~"
  else
    end=${PWD##*/}
    dir=${PWD%/*}
    [[ "$dir" =~ ^"$HOME"(/|$) ]] && dir="~${dir#$HOME}"
    dir=(${(ps./.)${dir}})
    for part in $dir; {
      [[ "~" == "$part" ]] && sep='' || sep='/'
      [[ "." == "${part:0:1}" ]] && count=2 || count=1
      result+="${sep}${part:0:$count}"
    }
    result+="/$end"
    echo -n "$result"
  fi
}

PROMPT='%{$fg[$NCOLOR]%}%n%{$reset_color%}@%{$fg[cyan]%}%m\
%{$reset_color%}:%{$fg[magenta]%}$(short_dir)\
$(git_prompt_info) \
%{$fg[red]%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}○%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})%{$reset_color%}"
