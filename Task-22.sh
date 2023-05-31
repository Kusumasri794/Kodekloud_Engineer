#Linux Banner

#Exercise: 22 During the monthly compliance meeting, it was pointed out that several servers in the Stratos DC do not have a valid banner. The security team has provided serveral approved templates which should be applied to the servers to maintain compliance. These will be displayed to the user upon a successful login.
#Update the message of the day on all application and db servers for Nautilus. Make use of the approved template located at /tmp/nautilus_banner on jump host

#Solution:
#step:1 Login to Thor servers and list all files
thor@jump_host ~$ls -l

# SCP(server copy) nautilus_banner into all apps servers as well as DB server

thor@jump_host ~$ scp nautilus_banner tony@172.16.238.10:/tmp
thor@jump_host ~$ scp nautilus_banner steve@172.16.238.11:/tmp
thor@jump_host ~$ scp nautilus_banner banner@172.16.238.12:/tmp
thor@jump_host ~$ scp nautilus_banner peter@172.16.239.10:/tmp

#under DB server copy, there was an issue, so login to DB server and installed openssh-client package
thor@jump_host ~$ ssh peter@172.16.239.10
[peter@stdb01 ~]$ sudo su -
[sudo] password for peter: 
Last login: Wed May 31 04:01:22 UTC 2023 on pts/0
[peter@stdb01 ~]$ yum install openssh-clients -y

# openssh-clients packages has installed sucessfully

#Here I tried again to  copy nautilus_banner into DB servers
thor@jump_host ~$ scp -r /root/nautilus_banner peter@172.16.239.10:/tmp
thor@jump_host ~$ sudo scp -r /root/nautilus_banner peter@172.16.239.10:/tmp
thor@jump_host ~$ scp -r nautilus_banner peter@172.16.239.10:/tmp # this step worked well and sucessfully copied to DB

#switch to all application server and verified a nautilus_banner data
thor@jump_host ~$ ssh tony@172.16.238.10
[tony@stapp01 ~]$ sudo su -
[sudo] password for tony: 
Last login: Wed May 31 04:01:22 UTC 2023 on pts/0
[root@stapp01 ~]# cd /tmp
[root@stapp01 tmp]# ls -l
total 8
-rwx------ 1 root  root   836 Aug  1  2019 ks-script-rnBCJB
-rw-r--r-- 1 peter peter 2530 May 31 04:05 nautilus_banner
-rw------- 1 root  root     0 Aug  1  2019 yum.log
[root@stapp01 tmp]# mv nautilus_banner /etc/motd
mv: overwrite ‘/etc/motd’? yes
[root@stapp01 tmp]# cat /etc/motd
[root@stapp01tmp] exit

thor@jump_host ~$ ssh steve@172.16.238.11
[steve@stapp02 ~]$ sudo su -
[sudo] password for steve: 
Last login: Wed May 31 04:01:22 UTC 2023 on pts/0
[root@stapp02 ~]# cd /tmp
[root@stapp02 tmp]# ls -l
total 8
-rwx------ 1 root  root   836 Aug  1  2019 ks-script-rnBCJB
-rw-r--r-- 1 peter peter 2530 May 31 04:05 nautilus_banner
-rw------- 1 root  root     0 Aug  1  2019 yum.log
[root@stapp02 tmp]# mv nautilus_banner /etc/motd
mv: overwrite ‘/etc/motd’? yes
[root@stapp02 tmp]# cat /etc/motd
[root@stapp02 tmp] exit

thor@jump_host ~$ ssh banner@172.16.238.12  
[banner@stapp03 ~]$ sudo su -
[sudo] password for banner: 
Last login: Wed May 31 04:01:22 UTC 2023 on pts/0
[root@stapp03 ~]# cd /tmp
[root@stapp03 tmp]# ls -l
total 8
-rwx------ 1 root  root   836 Aug  1  2019 ks-script-rnBCJB
-rw-r--r-- 1 peter peter 2530 May 31 04:05 nautilus_banner
-rw------- 1 root  root     0 Aug  1  2019 yum.log
[root@stapp03 tmp]# mv nautilus_banner /etc/motd
mv: overwrite ‘/etc/motd’? yes
[root@stapp03 tmp]# cat /etc/motd
[root@stapp03 tmp] exit

thor@jump_host ~$ ssh peter@172.16.239.10
peter@172.16.239.10's password: 
Last login: Wed May 31 04:01:12 2023 from jump_host.linux-banner-v2_db_net
[peter@stdb01 ~]$ sudo su -
[sudo] password for peter: 
Last login: Wed May 31 04:01:22 UTC 2023 on pts/0
[root@stdb01 ~]# cd /tmp
[root@stdb01 tmp]# ls -l
total 8
-rwx------ 1 root  root   836 Aug  1  2019 ks-script-rnBCJB
-rw-r--r-- 1 peter peter 2530 May 31 04:05 nautilus_banner
-rw------- 1 root  root     0 Aug  1  2019 yum.log
[root@stdb01 tmp]# mv nautilus_banner /etc/motd
mv: overwrite ‘/etc/motd’? yes
[root@stdb01 tmp]# cat /etc/motd
[root@stdb01 tmp] exit

#exit and logout from all servers