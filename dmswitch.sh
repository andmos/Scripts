#!/bin/bash
# Basic Dead Man's Switch v1.0
# Options:
# 1) dmswitch setup
#    sets up the script in your home dir with some default settings.
#    best to set it up manually or automatically rather than a mix of the two.
# 2) dmswitch test
#    sends a test email to the itself.
# 3) dmswitch reset
#    'checks in' with the dead man switch and resets the counter to zero
#    Just does the same thing as touching the scriptfile.
# 4) dmswitch
#    default. if the time has expired, IT WILL SEND AN EMAIL.
 
 
#SETUP VARIABLES
#some running variables are based on the setup vars
setupdir=$HOME"/.dmswitch"
setupattachmentdir="attachments"
setupmessage="message"
checkscript="check_switch.sh"
resetscript=$HOME"/Desktop/reset_switch.sh"
croncommand="0 0 * * * "$setupdir"/"$checkscript #cron line for how often it checks expiry. Default is daily.
 
 
#RUNNING VARIABLES
#make sure you change the email settings.
dmdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
timelimit=30 #Number of days to wait without update
expired=0
emailto="someemail@gmail.com" #The target address
emailfrom="myemail@gmail.com" #The account you send with
emailusername="myemail@gmail.com" #The username for your email account
emailpass="myemailpassword" #password
emailserver="smtp.gmail.com"
emailport="587"
emailsubject="Automated email from Dead Man's Switch."
message=$dmdir"/"$setupmessage # the text file you want your message stored in
attachmentdir=$dmdir"/"$setupattachmentdir # put any attachments you want to include here
 
 
#checks if the time has run out. Does the maths in unix time.
function checkifexpired() {
    let timelimit=$timelimit*60*60*24
    lastaccessed=$(stat -c %Y $BASH_SOURCE)
    timenow=$(date +%s)
    let timeleft=($timenow-$lastaccessed)
    if [ $timeleft -gt $timelimit ]
    then expired=1
    fi
}
 
#sends an email. replace sendemail with whatever program you prefer.
function sendemail() {
    attachmentlist=$(ls $attachmentdir)
    cd $attachmentdir
    sendEmail -f $emailfrom -t $emailto -u $emailsubject -s $emailserver":"$emailport -xu $emailusername -xp $emailpass -a $attachmentlist -o message-file=$message
}
 
#sets up a directory to run from and creates the necessary files.
function setupdm() {
    mkdir -p $setupdir
    cp $BASH_SOURCE $setupdir"/"$checkscript
 rm $BASH_SOURCE
    cd $setupdir
    chmod +x $checkscript
    mkdir $setupattachmentdir
    touch $setupmessage
    echo "If you can read this, I'm dead or arrested or something" >>$setupmessage
 
    #append cron job to existing cron file
    (crontab -l; echo "$croncommand" ) | crontab
     
    #setup reset script on desktop
 touch $resetscript
    echo "#! /bin/bash" >>$resetscript
    echo "checkfile="$setupdir"/"$checkscript >>$resetscript
    echo "touch $""checkfile" >>$resetscript
    chmod +x $resetscript
    echo "setup complete"
     
}
 
 
#main script starts here
 
checkifexpired
 
if [ "$1" == "setup" ]
then
    setupdm
elif [ "$1" == "test" ]
then
    #send test email to yourself
    emailto=$emailfrom
    emailsubject="TEST: "$emailsubject
    sendemail
  
elif [ "$1" == "reset" ]
then
 touch $BASH_SOURCE
elif [ $expired -eq 1 ]
then
    #send the email, and disable the script from running
    sendemail
    chmod -x $BASH_SOURCE
else exit
fi