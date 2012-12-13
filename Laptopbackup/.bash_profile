# if - statement checks uname for kernel and sets local variables and working 
# envirement after this. 
# written by Andreas Mosti  

export username=$(whoami)

if [[ "$(uname)" == "Darwin" ]] 
then
alias t='"/Users/$username/Dropbox/Scripts/todo.sh"'
alias latex='perl ~/.latexmk'
alias sshskript='"/Users/$username/Dropbox/Scripts/sshskript.bash"'
alias flushdns='dscacheutil -flushcache'
alias latex='perl ~/.latexmk'
alias nmapskript='"/Users/$username/Dropbox/Scripts/nmapskript.bash"'
alias backupprofile='"/Users/$username/Dropbox/Scripts/backubashprofile.bash"'
alias delmappehttp='python -m SimpleHTTPServer 8080'
alias killdashboard='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock'
alias aktiverdashboard='defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=$PATH:/Applications/NetBeans/glassfish-3.1.1/javadb/bin:
export TERM=xterm
export CLASSPATH=/System/Library/Frameworks/JavaVM.framework/Classes/classes.jar
export CLASSPATH=$CLASSPATH:~/jars/jogl.jar
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

echo "Mac - profil lastet" 

fi

if [[ "$(uname)" == "Linux" ]]
then 
alias nmapskript='"/home/$username/Dropbox/Scripts/nmapskript.bash"'
alias sshskript='"/home/$username/Dropbox/Scripts/sshskript.bash"'
alias delmappe='python -m SimpleHTTPServer 8080'
alias startminecraft='screen java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui'
echo "Linux - profil lastet" 

fi 






