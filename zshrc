# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =====
# ===== Zplugin
# =====
# plugins=(extract zsh-autosuggestions autojump zsh-syntax-highlighting vi-mode)
source "$HOME/.zinit/bin/zinit.zsh"

# 快速目录跳转
zplg ice lucid wait='1'
zplg light skywind3000/z.lua

# 语法高亮
zplg ice lucid wait='0' atinit='zpcompinit'
zplg light zdharma/fast-syntax-highlighting

# 自动建议
zplg ice lucid wait="0" atload='_zsh_autosuggest_start'
zplg light zsh-users/zsh-autosuggestions

# 补全
zplg ice lucid wait='0'
zplg light zsh-users/zsh-completions

# 加载 OMZ 框架及部分插件
zplg snippet OMZ::lib/completion.zsh
zplg snippet OMZ::lib/history.zsh
zplg snippet OMZ::lib/key-bindings.zsh
zplg snippet OMZ::lib/theme-and-appearance.zsh
zplg snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zplg ice svn
zplg snippet OMZ::plugins/extract

zplugin snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
zplugin ice svn
zplugin ice depth=1; zplugin light romkatv/powerlevel10k

# vi-mode
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
  # Use beam shape cursor on startup.
echo -ne '\e[5 q'
  # Use beam shape cursor for each new prompt.
preexec() {
	echo -ne '\e[5 q'
}
_fix_cursor() {
	echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
zle -N zle-line-init
zle -N zle-keymap-select

# atuosuggestion
# bindkey ';' autosuggest-accept


# =====
# ===== Main 
# =====
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/home/orongxing/miniconda3/bin:$PATH"  # commented out by conda initialize
export PATH="/home/orongxing/miniconda3/envs/python36/bin:$PATH"  # commented out by conda initialize
export PATH="/home/orongxing/miniconda3/envs/python27/bin:$PATH"  # commented out by conda initialize
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
export RANGER_LOAD_DEFAULT_RC="false"
export EDITOR=nvim


# =====
# ===== Alias
# =====
alias open='xdg-open'
alias vim='nvim'
alias ra='ranger'
alias sudo='sudo '
alias c='clear'
alias s='screenfetch'
alias cat='ccat'
alias bat='tlp bat'
alias ac='tlp ac'
alias lg='lazygit'
alias hexod="bash ~/orxing-blog/hexo-deploy.sh"
# don't use rm
alias tp='trash-put'           # trash files and directories.
alias te='trash-empty'         # empty the trashcan(s).
alias tl='trash-list'          # list trashed files.
alias tr='trash-restore'       # restore a trashed file.
# trash-rm            # remove individual files from the trashcan.


# =====
# ===== User configuration
# =====
# fzf
export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='\'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
export PATH=$HOME/.nvm/versions/node/v13.5.0/bin/:$PATH

# jump to previous folder
cdlast() {
  cd -
  #ls -lrth --color=auto | tail
  zle reset-prompt
}
zle -N cdlast
bindkey '^Z' cdlast

# thefuck
eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
