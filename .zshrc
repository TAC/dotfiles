export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export EDITOR=vim
export PAGER=lv
export LV=-Ou8
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LESS='-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS'
export LESSOPEN='| $HOME/bin/src-hilite-lesspipe.sh %s'

#ターミナル操作
autoload -U compinit && compinit #自動補完の有効化
autoload -U colors && colors     #プロンプトの色付け
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*:default' menu select=1 #補完候補を矢印キーで移動する
setopt auto_cd           #ディレクトリ名でcdできるようにする
setopt auto_pushd        #cd -[tab]で移動履歴を表示する
setopt correct           #誤入力すると正しいコマンドをサジェストする
setopt nobeep            #ビープ音を鳴らさない
setopt magic_equal_subst #--prefix=等のイコール後のパスを補完する
setopt list_packed       #lsコマンドの結果を通常より詰めて表示する
bindkey -e

#プロンプト
setopt prompt_subst #プロンプトの拡張
PROMPT="%B%{[33m%}%n:%{[m%}%b " #[host user:]と表示する
PROMPT2="%B%{[33m%}%_%{[m%}%b "
SPROMPT="%BDid you mean %{[31m%}%r? [n,y,a,e]:%{[m%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
RPROMPT="%{[36m%}[%~]%{[m%}"     #右側にカレントディレクトリを表示する

#履歴
HISTFILE=~/.zsh_history     #履歴のディレクトリ
HISTSIZE=10000              #履歴最大サイズ
SAVEHIST=10000              #保存数
setopt   hist_ignore_dups   #重複するコマンドを履歴に残さない
#setopt   share_history      #コマンド履歴を複数ターミナルで共有する
autoload history-search-end #コマンド履歴検索の有効化
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end  history-search-end
bindkey "^P" history-beginning-search-backward-end #Ctr-p で履歴の前コマンドを表示
bindkey "^N" history-beginning-search-forward-end  #Ctr-n で履歴の次コマンドを表示

#エイリアス
setopt complete_aliases
alias j="jobs -l"
alias ls="ls -G -w"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias vi="vim"       #viと押せばvim起動
alias nave="$HOME/bin/nave/nave.sh"
alias jman="env LC_CTYPE=ja_JP.eucJP GROFF_NO_SGR=true jman"
alias -s txt=lv      #txtファイルを指定するとlv
alias -s xml=lv      #xmlファイルを指定するとlv
alias -s conf=lv     #confファイルを指定するとlv
alias -s cnf=lv      #cnfファイルを指定するとlv
alias -s ini=lv      #iniファイルを指定するとlv
alias -s md=lv       #mdファイルを指定するとlv
alias -s markdown=lv #markdownファイルを指定するとlv

#Start tmux on every shell login
#https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux attach || tmux new-session)
fi

# The next line updates PATH for the Google Cloud SDK.
source '/usr/home/iida/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/usr/home/iida/google-cloud-sdk/completion.zsh.inc'

