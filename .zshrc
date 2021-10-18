# -----------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#  9.   Functions
#  10.  Reminders & Notes
#
# -----------------------------------------------------------------------------
#  1. Enivironment Configuration
# -----------------------------------------------------------------------------
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# -----------------------------------------------------------------------------
# Set Paths
# -----------------------------------------------------------------------------
    # Path to your oh-my-zsh installation
    export ZSH="$HOME/.oh-my-zsh"

    # Local directories fore easy access and config
    export USR_LOCAL=/usr/local
    export USR_LOCAL_SBIN=/usr/local/sbin

    # Set development paths
    export USR_LOCAL_MYSQL=/usr/local/mysql
    export USR_LOCAL_GIT=/usr/local/git
    export M2_HOME=$HOME/.sdkman/candidates/maven/current
    export M2=$M2_HOME/bin
    export MAVEN_OPTS=-Xms256m -Xmx512m
    export GRADLE_HOME=$HOME/.sdkman/candidates/gradle/current

    # Configure path
    export PATH="$PATH:$USR_LOCAL/bin/"
    export PATH="$M2:$PATH"
    export PATH="$GRADLE_HOME/bin:$PATH"
    export PATH="$USR_LOCAL_GIT/bin:/sw/bin/:$USR_LOCAL/bin:/usr/local/:$USR_LOCAL_SBIN:$USR_LOCAL_MYSQL/bin:$PATH"

# -----------------------------------------------------------------------------
# Set Default Editor (change 'Nano' to the editor of your choice)
# -----------------------------------------------------------------------------
    export EDITOR=/usr/bin/vi
# -----------------------------------------------------------------------------
# Set default blocksize for ls, df, du
# from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
# -----------------------------------------------------------------------------
    export BLOCKSIZE=1k

# -----------------------------------------------------------------------------
# Re-link updated installs from b rew
# -----------------------------------------------------------------------------
#   GNU "which" has been installed as "gwhich".
#   If you need to use it as "which", you can add a "gnubin" directory
#   to your PATH from your bashrc like:

    PATH="/usr/local/opt/gnu-which/libexec/gnubin:$PATH"

#   GNU "indent" has been installed as "gindent".
#   If you need to use it as "indent", you can add a "gnubin" directory
#   to your PATH from your bashrc like:

    PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"

#   GNU "tar" has been installed as "gtar".
#   If you need to use it as "tar", you can add a "gnubin" directory
#   to your PATH from your bashrc like:

    PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"


#   GNU "sed" has been installed as "gsed".
#   If you need to use it as "sed", you can add a "gnubin" directory
#   to your PATH from your bashrc like:

    PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"


#   Commands also provided by macOS and the commands dir, dircolors, vdir have been installed with the prefix "g".
#   If you need to use these commands with their normal names, you can add a "gnubin" directory to your PATH with:
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# -----------------------------------------------------------------------------
# Set OH MY ZSH Theme
# -----------------------------------------------------------------------------
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# recommended themes - jonathan, robbyrussell, agnoster
ZSH_THEME="powerlevel10k/powerlevel10k"

# https://gist.github.com/cviebrock/985684a169cf9a2b117d99dd9415a448
# General
POWERLEVEL9K_MODE="nerdfont-complete"
#POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_DATE_FORMAT="%D{%m/%d/%y}"

#POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"

# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
#POWERLEVEL9K_LEFT_PROMPT_CONTEXT_FOREGROUND='008'
#POWERLEVEL9K_DIR_BACKGROUND='117'
#POWERLEVEL9K_VCS_BACKGROUND='008'
POWERLEVEL9K_DISABLE_RPROMPT=false

# POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"

# function zsh_wifi_signal(){
#         local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
#         local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

#         if [ "$airport" = "Off" ]; then
#                 local color='%F{black}'
#                 echo -n "%{$color%}Wifi Off"
#         else
#                 local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
#                 local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
#                 local color='%F{black}'

#                 [[ $speed -gt 100 ]] && color='%F{black}'
#                 [[ $speed -lt 50 ]] && color='%F{red}'

#                 echo -n "%{$color%}$speed Mbps \uf1eb%{%f%}" # removed char not in my PowerLine font
#         fi
# }

# Prompts
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon time context battery dir virtualenv vcs)
else
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon time root_indicator context battery dir virtualenv vcs)
fi
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status date dir_writable public_ip ram load background_jobs newline java_version) 
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0b0'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0b2'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460\uF460\uF460 "

# Dir segment
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=…
#POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{grey}\/%F{white}"
#POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='241'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_BACKGROUND='241'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='241'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'

# Custom segment "now playing"
#POWERLEVEL9K_CUSTOM_NOW_PLAYING='~/.dotfiles/bin/nowplaying'
#POWERLEVEL9K_CUSTOM_NOW_PLAYING_BACKGROUND='blue'
#POWERLEVEL9K_CUSTOM_NOW_PLAYING_FOREGROUND='black'

# Root segment
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='red'
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='black'
POWERLEVEL9K_ROOT_ICON="\uf21b"

# Status segment
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_OK_BACKGROUND='black'
POWERLEVEL9K_STATUS_OK_FOREGROUND='236'
POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_COLOR='010'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='black'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='236'
POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_COLOR='red'

# Background jobs segment
POWERLEVEL9K_BACKGROUND_JOBS_ICON="\uf423"

# Battery segment
POWERLEVEL9K_BATTERY_CHARGING='107'
POWERLEVEL9K_BATTERY_CHARGED='blue'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='50'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'

# VCS segment
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='239'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='010'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='239'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='yellow'
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='239'
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='red'

# SSH segment
POWERLEVEL9K_SSH_BACKGROUND='blue'
POWERLEVEL9K_SSH_FOREGROUND='white'

# Context segment
POWERLEVEL9K_CONTEXT_TEMPLATE="\uf109 %m"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='blue'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='white'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='red'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${HOME}/.oh-my-zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-sdkman
)

source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# User configuration
# -----------------------------------------------------------------------------
#
# To override zsh prompt - but doing so will break listing the git branch
# PROMPT='%n@%m %~ %% '
#
# -----------------------------------------------------------------------------
# Add color to terminal
# (this is all commented out as I use Mac Terminal Profiles)
# from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
# -----------------------------------------------------------------------------
#   export CLICOLOR=1
#   export LSCOLORS=ExFxBxDxCxegedabagacad
#
# export MANPATH="/usr/local/man:$MANPATH"
#
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
#
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
#
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#
# -----------------------------------------------------------------------------
#   2.  MAKE TERMINAL BETTER
# -----------------------------------------------------------------------------
#
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
# IN ORDER FOR EDIT TO WORK SUBLIME NEEDS A LINK CREATED
# http://stackoverflow.com/questions/16199581/opening-sublime-text-on-command-line-as-subl-on-mac-os
# ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

#   lr:  Full Recursive Directory Listing
# -----------------------------------------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
# -----------------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   showa: to remind yourself of an alias (given some part of it)
# -----------------------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

# -----------------------------------------------------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
# -----------------------------------------------------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)

#   cdf:  'Cd's to frontmost window of MacOS Finder
# -----------------------------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

#   extract:  Extract most know archives with one command
# -----------------------------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }


# -----------------------------------------------------------------------------
#   4.  SEARCHING
# -----------------------------------------------------------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
# -----------------------------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


# -----------------------------------------------------------------------------
#   5.  PROCESS MANAGEMENT
# -----------------------------------------------------------------------------

#   findPid: find out the pid of a specified process
# -----------------------------------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
# -----------------------------------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
# -----------------------------------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
# -----------------------------------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
# -----------------------------------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
# -----------------------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
# -----------------------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
# -----------------------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


# -----------------------------------------------------------------------------
#   6.  NETWORKING
# -----------------------------------------------------------------------------
# - https://unix.stackexchange.com/questions/22615/how-can-i-get-my-external-ip-address-in-a-shell-script
# - https://coderwall.com/p/lyrjsq/extract-your-external-ip-using-command-line-tools
# -----------------------------------------------------------------------------
    alias wanip='dig @resolver4.opendns.com myip.opendns.com +short' 
    alias wanip4='dig @resolver4.opendns.com myip.opendns.com +short -4'
    alias wanip6='dig @resolver1.ipv6-sandbox.opendns.com AAAA myip.opendns.com +short -6'
    alias myip='curl ifconfig.me/ip'                    # myip:         Public facing IP Address
    alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
    alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
    alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
    alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
    alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
    alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
    alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
    alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
    alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
# -----------------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }


# -----------------------------------------------------------------------------
#   7.  SYSTEMS OPERATIONS & INFORMATION
# -----------------------------------------------------------------------------
    alias mountReadWrite='/sbin/mount -uw /'                # mountReadWrite:   For use when booted into single-user

#   cleanupDS:  Recursively delete .DS_Store files
# -----------------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
# -----------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#    screensaverDesktop: Run a screensaver on the Desktop
# -----------------------------------------------------------------------------
    alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

# -----------------------------------------------------------------------------
#   8.  WEB DEVELOPMENT
# -----------------------------------------------------------------------------

    alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
    alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
    alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
    alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
    alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:   Shows apache error logs
    httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page

#   httpDebug:  Download a web page and show info on what took time
# -----------------------------------------------------------------------------
    httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

# -----------------------------------------------------------------------------
#   9.  FUNCTIONS
# -----------------------------------------------------------------------------
function reloadZsh() {
    source ~/.zshrc
}

function reloadBash() {
    source ~/.bash_profile
}

function removeFromPath() {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

function cleanlock() {
    find $HOME/.gradle/ -name "*.lock" | xargs rm
}

function cleanlockproject() {
    find $HOME/Repository/*/.gradle/ -name "*.lock" | xargs rm
}

function cleanbuild() {
    cleanlock
    ./gradlew clean build
}

function publish() {
    cleanlock
    ./gradlew clean build uploadArchives
}

function listfunc() {
    echo "List of custom terminal commands"
    echo "reloadZsh"
    echo "reloadBash"
    echo "removeFromPath"
    echo "cleanlock"
    echo "cleanlockproject"
    echo "cleanbuild"
    echo "publish"
}

function cmdhelp() {
    echo "Reminder of how to do certain functions"
    echo "TODO"
}

# -----------------------------------------------------------------------------
#   10.  REMINDERS & NOTES
# -----------------------------------------------------------------------------

#   remove_disk: spin down unneeded disk
# -----------------------------------------------------------------------------
#   diskutil eject /dev/disk1s3

#   to change the password on an encrypted disk image:
# -----------------------------------------------------------------------------
#   hdiutil chpass /path/to/the/diskimage

#   to mount a read-only disk image as read-write:
# -----------------------------------------------------------------------------
#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

#   mounting a removable drive (of type msdos or hfs)
# -----------------------------------------------------------------------------
#   mkdir /Volumes/Foo
#   ls /dev/disk*   to find out the device to use in the mount command)
#   mount -t msdos /dev/disk1s1 /Volumes/Foo
#   mount -t hfs /dev/disk1s1 /Volumes/Foo

#   to create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil
# -----------------------------------------------------------------------------
#   e.g.: mkfile 10m 10MB.dat
#   e.g.: hdiutil create -size 10m 10MB.dmg
#   the above create files that are almost all zeros - if random bytes are desired
#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat

# -- Depricated ---------------------------------------------------------------
#   The Java JDK is set using the functions under the Functions header these are
#   left in place so that the full path is easy to find if needed.
#
#   Most likely these functions are no longer necessary thanks to SDKMAN but are
#   left in place in case manual setting is ever required
# -----------------------------------------------------------------------------
#
#   Oracle JDK
#   export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk
#   export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk
    
#   Apple Standard JDK
#   export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home

#   Add $JAVA_HOME to the system PATH
#   export PATH=$PATH:$JAVA_HOME

# -----------------------------------------------------------------------------
#   Functions (Usage: setjdk 1.X)
# -----------------------------------------------------------------------------
#   Found functions here; without the different quotes around export JAVA_HOME
#   this will not work. 
#   http://www.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick/
# -----------------------------------------------------------------------------
    function setjdk() {
       if [ $# -ne 0 ]; then
          removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
       if [ -n "${JAVA_HOME+x}" ]; then
          removeFromPath $JAVA_HOME
       fi
       echo "Setting Java version to " $@
       export JAVA_HOME=`/usr/libexec/java_home -v $@`
       echo "JAVA_HOME is now set to " $JAVA_HOME
       export PATH=$JAVA_HOME/bin:$PATH
       ECHO "PATH is now set to " $PATH
       fi
    }
    function removeFromPath() {
        export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
    }

source $(dirname $(gem which colorls))/tab_complete.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
