# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# only if running interactively
if [ "$PS1" ]; then

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

    # osiecki@20130319 - more stuff in path
    export PATH=/usr/bin:$PATH
    export PATH=/home/osiecki/script:$PATH
    export PATH=/home/osiecki/bin:$PATH
    export PATH=/home/osiecki/ttemp/awsshell:$PATH
    export PATH=/home/osiecki/dev/recs/RecordStream/bin:$PATH
    export PATH=/home/osiecki/installs/android-sdk-linux/platform-tools:$PATH
    export PATH=/home/osiecki/installs/gradle/gradle-2.4/bin:$PATH
    export PATH=/home/osiecki/installs/PathPicker:$PATH

    # osiecki@20140414 - perl path
    export PERL5LIB=$PERL5LIB:/home/osiecki/dev/recs/RecordStream/lib

    # osiecki@20061214 - personal preferences
    export EDITOR=vim
    export VISUAL=vim
    alias dir="ls --color=tty -hlF"
    alias dira="ls --color=tty -hAlF"
    alias cd..="cd .."
    alias dirsize="du -hs"
    alias myps="ps -fl axf | grep 'osiecki'"
    alias myw="w | grep 'osiecki'"
    alias psall="ps --forest -fl ax"
    alias cdpwd="cd \`pwd -P\`"
    alias scr="screen -x"
    alias svnrever="svn revert --recursive ."
    alias historysync="history -n"

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

    function follow() {
        ~/installs/android-sdk-linux/platform-tools/adb logcat -v time | egrep --line-buffered -i --no-group-separator --context=1 'exception|newsblur| at .*java' | egrep --line-buffered -v -i 'GA.SERVICE|AbstractMetricsFactoryImpl' | trim_and_colour
    }

    function followall() {
        ~/installs/android-sdk-linux/platform-tools/adb logcat -v time | trim_and_colour
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
    export HISTSIZE=16384
    export HISTFILESIZE=16384

    # osiecki@20130319 - run after every shell command
    export PROMPT_COMMAND="history -a"

    # osiecki@20130319 - load libs for debian
    export PKG_CONFIG_PATH=/usr/share/pkgconfig/

    # osiecki@20120706 - UTF, please
    export LANG=en_US.UTF-8
    export NCURSES_NO_UTF8_ACS=1

    # osiecki@20130615 - runtime libs
    export LD_LIBRARY_PATH=/usr/local/lib/

    # osiecki@20141108 - no terminal stops
    stty stop undef
    stty start undef

fi

export PATH=/home/osiecki/installs/torch/install/bin:$PATH  # Added automatically by torch-dist
export LD_LIBRARY_PATH=/home/osiecki/installs/torch/install/lib:$LD_LIBRARY_PATH  # Added automatically by torch-dist
export DYLD_LIBRARY_PATH=/home/osiecki/installs/torch/install/lib:$DYLD_LIBRARY_PATH  # Added automatically by torch-dist
