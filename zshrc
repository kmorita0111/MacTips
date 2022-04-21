#履歴に100000保存
export HISTFILE=${HOME}/.zsh_history
export SAVEHIST=100000
export HISTSIZE=1000

setopt SHARE_HISTORY

#プロンプトの色付け
autoload -U colors
colors
PS1="%{$fg[cyan]%}morita%{${fg[default]}%}[%~]%#%{${fg[green]}%} "

#補完時の大文字小文字の区別なし
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#補完候補に色付け
alias alias dircolors=gdircolors
eval `dircolors`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

setopt IGNORE_EOF

setopt NO_CLOBBER

setopt CORRECT

setopt CORRECT_ALL

setopt EXTENDED_HISTORY

setopt LIST_ROWS_FIRST

setopt AUTO_NAME_DIRS

setopt AUTO_PUSHD

setopt PUSHD_IGNORE_DUPS

setopt CDABLE_VARS

setopt MENU_COMPLETE

setopt ALL_EXPORT

setopt INTERACTIVE_COMMENTS

setopt PRINT_EIGHT_BIT
#aliasの設定
setopt ALIASES

[ -n "`alias run-help`" ] && unalias run-help
autoload run-help

autoload -U compinit
compinit

#mail_check
MAILPATH="/var/mail/$USER?${fg_bold[green]}You have new mail in \$_."
MAILPATH="/var/spool/mail/$USER?${fg_bold[green]}You have new mail in \$_."

MAILCHECK=20

#login_check_of_all_the_member
watch=(all)
#interval_assess
LOGHECK=20

#cursol_to_end
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
#改行

#関数の登録
fpath=(~/func $fpath)
autoload ${fpath[1]/*(:t)}

#auto_ls
setopt AUTO_CD
function chpwd(){ gls -F --color}
#function chpwd(){ ls -F -G}
autoload chpwd
#ls = ls -F
alias ls='gls -F --color'
#alias ls='ls -F -G'

#ターミナルの上に現在のコマンドを表示
function preexec(){
[[ -t 1 ]] || return
case $TERM in
(*xterm*|screen|rxvt|(dt|k|E)term) print -Pn "\e]2;[%~] $1\a" ;;
esac
}
autoload preexec

#emacsパス通す
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

#libsbmlのパス
export LD_LIBRARY_PATH=/usr/local/lib

export HDF5_USE_FILE_LOCKING=FALSE

#mavenのパス
export M3_HOME=~/apache-maven-3.6.2
M3=$M3_HOME/bin
export PATH=$M3:$PATH

#ゴミ箱に送る
alias delete="poi"
poi(){
    mv $* ~/.Trash
}

# rm の時必ず確認する
alias rm="rm -i"

# ツリー構造の設定
#alias ls="exa -F --icons"
#alias lt="ls -T"

# git status
alias gitstatus="git status"
# git のツリー構造の可視化
alias gitlog="git log --graph --all --decorate"
# git cli 補完
eval "$(gh completion -s zsh)"

#zshのhook機能
#autoload -Uz add-zsh-hook
#add-zsh-hook precmd precmd

# Disable the log builtin, so we don't conflict with /usr/bin/log
#disable log

# MacPorts のパス通す
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH

# JetBrains Runtime (OpenJDK) のパス通す。
# Java8 の中で一番新しいバージョンを使うように指定
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/JBRSDK8"

# Rstudio パス通す
alias rstudio="open -n /Applications/RStudio.app"
