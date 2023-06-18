# Task-36 Linux Postfix Mail Server
#Exercise: xFusionCorp Industries has planned to set up a common email server in Stork DC. After several meetings and recommendations they have decided to use postfix as their mail transfer agent and dovecot as an IMAP/POP3 server. We would like you to perform the following steps:
#Install and configure postfix on Stork DC mail server.
#Create an email account yousuf@stratos.xfusioncorp.com identified by B4zNgHA7Ya.
#Set its mail directory to /home/yousuf/Maildir.
#Install and configure dovecot on the same server.

# solution:

#login to mail server and switch to sudo user
sudo su -

#verify postfix package
rpm -qa |grep postfix

# install postfix package
yum install postfix -y

# open main.cf file in vi editor

vi /etc/postfix/main.cf

  # uncomment #myhostname = virtual.domain.tld  and add local host address (this is mail server hostname)
   myhostname = stmail01.stratos.xfusioncorp.com

  # uncomment mydomain = and add  stratos.xfusioncorp.com

    mydomain = stratos.xfusioncorp.com

  # search for myorigin = $mydomain and uncomment it  
    myorigin = $mydomain

  # Uncomment the '#inet_interfaces = all' line and comment inet_interfaces = $localhost
     inet_interfaces = all
  # comment mydestination = (1st line)
  # uncomment #mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
     mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
  #uncomment mynetworks =   168.0.0.0/24, 127.0.0.0/8 and add mailserver ip address
    mynetworks =   172.16.238.0/24, 127.0.0.0/8

  #uncomment home_mailbox = Maildir/
    home_mailbox = Maildir/
   #save a file and quit from /etc/postfix/main.cf

#start postfix service
systemctl start postfix

# add yousuf user with given password
useradd yousuf
passwd yousuf
  #here enter and re-enter password"B4zNgHA7Ya"
telnet stmail01 25

EHLO localhost

mail from: yousuf@stratos.xfusioncorp.com
rcpt to: yousuf@stratos.xfusioncorp.com
DATA 
test mail
quit


#install dovecot package

yum install dovecot -y

# open config file in /etc/dovecot/dovecot.conf vi editor

vi /etc/dovecot/dovecot.conf
 #Uncomment '#protocols = imap pop3 lmtp'
  protocols = imap pop3 lmtp
# save and close the config file

# open below file in vi edito 
vi /etc/dovecot/conf.d/10-mail.conf

 # Uncomment the line '#mail_location = maildir:~/Maildir'
   mail_location = maildir:~/Maildir
 # save and quit
vi /etc/dovecot/conf.d/10-auth.conf
  #uncomment the line '#disable_plaintext_auth = yes'
   disable_plaintext_auth = yes

  # Set the 'auth_mechanisms' line 
    auth_mechanisms = plain login
  #save and quit
vi /etc/dovecot/conf.d/10-master.conf
  # Uncomment and set the line '#user = '

     user = postfix
     group = postfix
   #save and quit
#start and enable dovecot service   
systemctl start dovecot      
systemctl status dovecot

#validate a pachage using telnet

telnet stmail01 110

user yousuf
 200 ok
pass  B4zNgHA7Ya

retr 1 .

quit

exit

  
   



