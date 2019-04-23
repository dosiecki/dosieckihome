# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# osiecki@20080421 - more prompt magic
function ps1pwd {
local pwdmaxlen1=20
local pwdmaxlen2=40
local elipses="..."
if [ ${#PWD} -gt $(( $pwdmaxlen1 + $pwdmaxlen2 )) ]
then
    local pwdoffset=$(( ${#PWD} - $pwdmaxlen2 ))
    newpwd="${PWD:0:$pwdmaxlen1}${elipses}${PWD:$pwdoffset:$pwdmaxlen2}"
else
    newpwd=${PWD}
fi
echo -n $newpwd
}

# osiecki@20061214 - custom prompt
export PS1="\n\[\e[0;36m\]<\[\e[0;32m\]\u\[\e[0;34m\]@\[\e[0;35m\]\h\[\e[0;34m\]:\[\e[0;36m\]\$(ps1pwd)\[\e[0;34m\]>\n\[\e[1;36m\]\t #\! $ \[\e[0;37m\]"

export PATH=/usr/bin:$PATH

# osiecki@20061214 - personal preferences
export EDITOR=vim
export VISUAL=vim
alias dir="ls --color=tty -hlF"
alias dira="ls --color=tty -hAlF"
alias cd..="cd .."
alias dirsize="du -hs"
alias myps="ps -fl axf | grep 'admin'"
alias myw="w | grep 'admin'"
alias psall="ps --forest -fl ax"
alias cdpwd="cd \`pwd -P\`"
alias scr="screen -x"

# osiecki@20070102 - coloured logtails
function trim_and_colour() {
sed -u '
s/^[0-9]\{2\}-[0-9]\{2\} //g
s/\([0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}.[0-9]\{3\}\) /\o033[34m\1\o033[0m /g
s/ \(V\/\)/ \o033[32m\1\o033[0m/g
s/ \(D\/\)/ \o033[36m\1\o033[0m/g
s/ \(I\/\)/ \o033[35m\1\o033[0m/g
s/ \(W\/\)/ \o033[33m\1\o033[0m/g
s/ \(E\/\)/ \o033[31m\1\o033[0m/g
s/\(Exception\)/\o033[31m\1\o033[0m/g
s/\(( *[0-9]\{1,9\})\):/\o033[34m\1\o033[0m/g
'
}

function vivid() {
sed -u -e '
s/\([-0-9]\{10\} [0-9,:]\{12\}\)/\o033[34m\1\o033[0m/g
s/ \[PID-[0-9]*\] / /g
s/ \[[0-9a-f]\{32\}\] / /g
s/ \(\[INFO \]\) / \o033[35m\1\o033[0m /g
s/ \(\[WARN \]\) / \o033[33m\1\o033[0m /g
s/\(Exception\)/\o033[31m\1\o033[0m/g
'
}

# osiecki@20130402 - set a new terminal name
function termname() {
echo -ne "\033]0;$1\007"
}

# osiecki@20070115 - shh/host tabcompletion
complete -A hostname ssh
export HOSTFILE=$HOME/.hosts

# osiecki@20130327 - completion for sudo commands
complete -cf sudo

# osiecki@20080421 - ignore .svn dirs in tab completion
export FIGNORE=".svn:.git";

# osiecki@20090630 - disable messaging
mesg n

# osiecki@20090723 - history improvements
shopt -s histappend
export HISTCONTROL=erasedups:ignorespace
export HISTSIZE=32768
export HISTFILESIZE=32768

# osiecki@20130319 - run after every shell command
export PROMPT_COMMAND="history -a; history -r"

# osiecki@20130319 - load libs for debian
export PKG_CONFIG_PATH=/usr/share/pkgconfig/

# osiecki@20120706 - UTF, please
export LANG=en_US.UTF-8
export NCURSES_NO_UTF8_ACS=1

# osiecki@20130615 - runtime libs
export LD_LIBRARY_PATH=/usr/local/lib/:/usr/lib/x86_64-linux-gnu/

# osiecki@20141108 - no terminal stops
stty stop undef
stty start undef

