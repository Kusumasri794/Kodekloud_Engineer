#Linux SSH Authentication

#Exercise: The system admins team of xFusionCorp Industries has set up some scripts on jump host that run on regular intervals and perform operations on all app servers in Stratos Datacenter. 
#To make these scripts work properly we need to make sure thor user on jump host haspassword-less SSH access to all app servers through their respective sudo users. 
#Based on the requirements, perform the following:

#Set up a password-less authentication for user thor on jump host to all app servers through their respective sudo users.

sudo su -
ssh-keygen

ssh-copy-id  tony@stapp01
ssh-copy-id steve@stapp02
ssh-copy-id banner@stapp03

#verify application servers can be access without password or not

ssh tony@stapp01
ssh steve@stapp02
ssh banner@stapp03

exit 

logout
