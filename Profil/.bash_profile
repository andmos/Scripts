# If - statement checks uname for kernel and sets local variables and working 
# environment after this. 
# written by Andreas Mosti  
# when edited, the symlink will sync with Dropbox and all devices get the new version of the file. If symlinc some how fucks up,
# unlink from both home directory and dropbox, then symlinc again. 

export username=$(whoami)

if [[ "$(uname)" == "Darwin" ]] 
then

alias t='"/Users/$username/Dropbox/Scripts/todo.sh"'
alias latex='perl ~/.latexmk'
alias sshskript='"/Users/$username/Dropbox/Scripts/sshskript.bash"'
alias syncprofil='"/Users/$username/Dropbox/Scripts/Syncprofil.bash"'
alias flushdns='dscacheutil -flushcache'
alias nmapskript='"/Users/$username/Dropbox/Scripts/nmapskript.bash"'
alias backupprofile='"/Users/$username/Dropbox/Scripts/backubashprofile.bash"'
alias eksternip='"/Users/$username/Dropbox/Scripts/eksternip.bash"'
alias sshtunell='"/Users/$username/Dropbox/Scripts/sshtunell.bash"'
alias tor-ssh='ssh -o ProxyCommand="nc -X 4 -x localhost:9050 %h %p"'
alias killdashboard='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock'
alias aktiverdashboard='defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock'
alias killspotlight='sudo mdutil -i on'
alias aktiverspotlight='sudo sudo mdutil -i off' 
alias dnsip='dig myip.opendns.com @resolver1.opendns.com +short' 
alias hist='open /Users/$username/Dropbox/HIST/Dataing/2år/'
alias rsyncbackup='"/Users/$username/Dropbox/Scripts/backupjob.bash"'
alias spotify='"/Users/$username/Dropbox/Scripts/spotify.bash"'
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#CLASSPATHS: 

export PATH=$PATH:/Applications/NetBeans/glassfish-3.1.1/javadb/bin: #if netbeans is installed, this fixes the javaDB variables.
# Works on the laptop as of 08.11.2012, may need change 
export TERM=xterm
export CLASSPATH=/System/Library/Frameworks/JavaVM.framework/Classes/classes.jar
export CLASSPATH=$CLASSPATH:~/jars/jogl.jar:. 
export CLASSPATH=$CLASSPATH:~/Dropbox/Kode/mostiBot/mostiBot/pircbot.jar
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/mysql/bin:$PATH" #mysql path  
export PATH="/usr/texbin:$PATH" #Path for TeX and LaTeX 


function authme {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
          < ~/.ssh/id_dsa.pub
  }

echo "Mac - profil lastet" 

fi

if [[ "$(uname)" == "Linux" ]]
then 

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias backupprofile='"/home/$username/Dropbox/Scripts/backubashprofile.bash"'
alias nmapskript='"/home/$username/Dropbox/Scripts/nmapskript.bash"'
alias sshskript='"/home/$username/Dropbox/Scripts/sshskript.bash"'
alias syncprofil='"/home/$username/Dropbox/Scripts/Syncprofil.bash"'
alias disktester='"/home/$username/Dropbox/Scripts/Disktester.bash"'
alias eksternip='"/home/$username/Dropbox/Scripts/eksternip.bash"'
alias linuxinstall='"/home/$username/Dropbox/Scripts/linuxinstall.bash"'
alias lampinstall='"/home/$username/Dropbox/Scripts/lampinstall.bash"'
alias sshtunell='"/home/$username/Dropbox/Scripts/sshtunell.bash"'
alias passmaker='"/home/$username/Dropbox/Scripts/passmaker.bash"'
alias dnsip='dig myip.opendns.com @resolver1.opendns.com +short'
alias unban='"/home/$username/Dropbox/Scripts/unban.bash"'


function ban() {
    if [ "`id -u`" == "0" ] ; then
                iptables -A INPUT -s $1 -j DROP
                    else
                                sudo iptables -A INPUT -s $1 -j DROP
                                    fi
                                }



echo "Linux - profil lastet" 

fi 

# Functions and aliases not depending on OS 

export CLASSPATH=$CLASSPATH:~/Dropbox/Kode/mostiBot/mostiBot/pircbot.jar

alias delmappehttp='python -m SimpleHTTPServer 8080'
alias e="exit"
alias tracert="traceroute"

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


