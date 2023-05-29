#21. Linux Remote Copy:

#Exercise: 
## One of the Nautilus developers has copied confidential data on the jump host in Stratos DC. That data must be copied to one of the app servers. Because developers do not have access to app servers, they asked the system admins team to accomplish the task for them.
##  Copy /tmp/nautilus.txt.gpg file from jump server to App Server 1 at location /home/app.

#Solution: 

# switching to /tmp directory
jump@server: cd /tmp

#list all files under /tmp server
jump@server/tmp: ls -l
# server copy from /tmp/nautilus.txt.gpg to user@IP:/tmp/
jump@server/tmp: scp /tmp/nautilus.txt.gpg  tony@172.168.20.3:/tmp/
#switch to app server 1 using credentials
jump@server/tmp: ssh tony@172.168.20.3
jump@server/tmp: password:

#switch to root user
tony@server: sudo su -
# change directory to /tmp and moved data from /tmp/ to /home/app
tony@server: cd /tmp
tony@server/tmp: mv nautilus.txt.gpg /home/app
tony@server/tmp:cd /home/app
tony@server/home/app: ls -l

tony@server/home/app:exit
tony@server:logout

