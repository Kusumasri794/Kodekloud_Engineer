# Install And Configure SFTP

# exercise: Some of the developers from Nautilus project team have asked for SFTP access to at least one of the app server in Stratos DC. After going through the requirements, the system admins team has decided to configure the SFTP server on App Server 2 server in Stratos Datacenter. Please configure it as per the following instructions:

# a. Create an SFTP user mariyam and set its password to TmPcZjtRQx.
# b. Password authentication should be enabled for this user.
# c. Set its ChrootDirectory to /var/www/app.
# d. SFTP user should only be allowed to make SFTP connections

# login to server 2 and switch to sudo user
[Steve@stapp02]# sudo su -

# step:a create a user and add into a directory /var/www/app
[root@stapp02 ~]#useradd -d /var/www/app -s /sbin/nologin mariyam
# step:b set a password mariyam to TmPcZjtRQx
[root@stapp02 ~]# passwd mariyam

# Create a directory as per the task /var/www/app, make root as a own and mode as readable
[root@stapp02 ~]#mkdir -p /var/www/app
[root@stapp02 ~]# chown root:root /var/www/app
[root@stapp02 ~]# cat /var/www/app
[root@stapp02 ~]# chmod 755 /var/www/app

# Step:d make chnages to sshd_config file that SFTP user should only be allowed to make SFTP connections
[root@stapp02 ~]# vi /etc/ssh/sshd_config
      # verify below parameters and add as per below           
                PasswordAuthentication yes
	            ChrootDirectory %h
	            AllowTCPForwarding no
	            X11Forwarding no
	            ForceCommand internal-sftp
	            AllowAgentForwarding no
	            AllowTcpForwarding no
	            PermitTunnel no
# restart sshd service and check for a status
[root@stapp02 ~]# service sshd restart
[root@stapp02 ~]# systemctl status sshd
  
# verify SFTP is working as per requirement, open other terminal thor@jump_host login to app server 2 with mariyam credentials., if we enter to SFTP with out any issues. Task is sucess.
 sftp mariyam@172.16.238.11
 passwor: enter mariyam password
 sftp: 
