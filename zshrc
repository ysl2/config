# =====
# ===== Start
# =====

# 将光标切换为插入模式
echo -ne '\e[5 q'
# 加载p10k-instant-prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =====
# ===== Zinit
# =====

source "$HOME/.zinit/bin/zinit.zsh"

# powerlevel10k 
zinit ice depth=1
zinit light romkatv/powerlevel10k

# 快速目录跳转
zinit ice lucid wait='1'
zinit light skywind3000/z.lua

# 语法高亮
zinit ice lucid wait atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

# 自动建议
zinit ice lucid wait atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# 加载 OMZ 框架及部分插件
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

# vi-mode
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh

# 解压缩
zinit ice svn lucid wait='1' 
zinit snippet OMZ::plugins/extract

# git
zinit ice lucid wait='1' 
zinit snippet OMZ::plugins/git/git.plugin.zsh

# =====
# ===== Export 
# =====

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/home/orongxing/miniconda3/envs/python36/bin:$PATH"  # commented out by conda initialize
export PATH="/home/orongxing/miniconda3/envs/python27/bin:$PATH"  # commented out by conda initialize
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/opt/wechat-devtool/bin
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export RANGER_LOAD_DEFAULT_RC="false"
export DOWNGRADE_FROM_ALA=1

# ranger 环境变量
export EDITOR=nvim
export TERMINAL=st
export SHELL=zsh

# =====
# ===== Alias
# =====
alias py36='conda activate python36'
alias py27='conda activate python27'
alias py37='conda activate python37'
alias note='vim ~/.note.md'
alias jn='jupyter notebook --ip=0.0.0.0 --allow-root'
alias ll="exa -l"
alias vim='nvim'
alias ra='ranger'
alias sudo='sudo -E '
alias c='clear'
alias s='neofetch'
alias sound='alsamixer'
alias bat='sudo tlp bat'
alias ac='sudo tlp ac'
alias lg='lazygit'
alias daka='cd ~/Development/Elecron/electron-react-antd-antv-cli/ && yarn ele:dev'
alias fmax="find ./ -type f -print0 | xargs -0 du -h | sort -rh | head -n 10"
# don't use rm
alias tp='trash-put'           # trash files and directories.
alias te='trash-empty'         # empty the trashcan(s).
alias tl='trash-list'          # list trashed files.
alias tr='trash-restore'       # restore a trashed file.
# trash-rm            # remove individual files from the trashcan.
alias q='exit'
alias proxy='export ALL_PROXY=socks5://127.0.0.1:1080'


# =====
# ===== User configuration
# =====
source ~/.zsh-defer/zsh-defer.plugin.zsh

# Vi-Mode
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
preexec() {
	echo -ne '\e[5 q'
}
_fix_cursor() {
	echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
zle -N zle-line-init
zle -N zle-keymap-select

# FZF
fzf_init() {
    export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
    export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
    export FZF_COMPLETION_TRIGGER='\'
    export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

zsh_stats () {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

ranger () {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map q chain shell echo %d > "$tempfile"; quitall!"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}


# NVM
nvm_init () {
    export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
    export NVM_DIR="$HOME/.nvm"
    # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
    export PATH=$HOME/.nvm/versions/node/v12.18.0/bin/:$PATH
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
conda_init () {
__conda_setup="$('/home/ourongxing/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ourongxing/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ourongxing/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ourongxing/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda activate python36
# <<< conda initialize <<<
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
### End of Zinit's installer chunk

zsh-defer conda_init
zsh-defer nvm_init
zsh-defer fzf_init

source /home/ourongxing/.config/broot/launcher/bash/br

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/ourongxing/Development/Elecron/electron-upload/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/ourongxing/Development/Elecron/electron-upload/node_modules/tabtab/.completions/electron-forge.zsh
