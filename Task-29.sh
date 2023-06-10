#Add Response Headers in Apache

# Exercise: We are working on hardening Apache web server on all app servers. As a part of this process we want to add some of the Apache response headers for security purpose. We are testing the settings one by one on all app servers. As per details mentioned below enable these headers for Apache: Install httpd package on App Server 1 using yum and configure it to run on 8088 port, make sure to start its service. 
#Create an index.html file under Apache's default document root i.e /var/www/html and add below given content in it.
#Welcome to the xFusionCorp Industries!
#Configure Apache to enable below mentioned headers:
#X-XSS-Protection header with value 1; mode=block
#X-Frame-Options header with value SAMEORIGIN
#X-Content-Type-Options header with value nosniff
#Note: You can test using curl on the given app server as LBR URL will not work for this task.


#solution:

# login to app server 1
thor@jump_host ~$ ssh tony@stapp01

The authenticity of host 'stapp01 (172.16.238.10)' can't be established.
ECDSA key fingerprint is SHA256:3Pjl25EfqpjZ+B9eBfQknqrXYF1CmiocC0MwlQQVNcc.
ECDSA key fingerprint is MD5:01:5f:59:5f:65:8e:20:d5:8d:88:ed:ce:4e:10:00:63.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'stapp01,172.16.238.10' (ECDSA) to the list of known hosts.

tony@stapp01's password: 

#switch to sudo user
[tony@stapp01 ~]$ sudo su -

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for tony: 

#install httpd service package
[root@stapp01 ~]# yum install httpd -y

Loaded plugins: fastestmirror, ovl
Determining fastest mirrors
 * base: ix-denver.mm.fcix.net
 * extras: mirrors.unifiedlayer.com
 * updates: mirror.math.princeton.edu
base                                                               | 3.6 kB  00:00:00     
extras                                                             | 2.9 kB  00:00:00     
updates                                                            | 2.9 kB  00:00:00     
(1/4): base/7/x86_64/group_gz                                      | 153 kB  00:00:00     
(2/4): base/7/x86_64/primary_db                                    | 6.1 MB  00:00:00     
(3/4): extras/7/x86_64/primary_db                                  | 249 kB  00:00:00     
(4/4): updates/7/x86_64/primary_db                                 |  21 MB  00:00:00     
Resolving Dependencies
--> Running transaction check
---> Package httpd.x86_64 0:2.4.6-99.el7.centos.1 will be installed
--> Processing Dependency: httpd-tools = 2.4.6-99.el7.centos.1 for package: httpd-2.4.6-99.el7.centos.1.x86_64
--> Processing Dependency: system-logos >= 7.92.1-1 for package: httpd-2.4.6-99.el7.centos.1.x86_64
--> Processing Dependency: /etc/mime.types for package: httpd-2.4.6-99.el7.centos.1.x86_64
--> Processing Dependency: libaprutil-1.so.0()(64bit) for package: httpd-2.4.6-99.el7.centos.1.x86_64
--> Processing Dependency: libapr-1.so.0()(64bit) for package: httpd-2.4.6-99.el7.centos.1.x86_64
--> Running transaction check
---> Package apr.x86_64 0:1.4.8-7.el7 will be installed
---> Package apr-util.x86_64 0:1.5.2-6.el7_9.1 will be installed
---> Package centos-logos.noarch 0:70.0.6-3.el7.centos will be installed
---> Package httpd-tools.x86_64 0:2.4.6-99.el7.centos.1 will be installed
---> Package mailcap.noarch 0:2.1.41-2.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

==========================================================================================
 Package              Arch           Version                        Repository       Size
==========================================================================================
Installing:
 httpd                x86_64         2.4.6-99.el7.centos.1          updates         2.7 M
Installing for dependencies:
 apr                  x86_64         1.4.8-7.el7                    base            104 k
 apr-util             x86_64         1.5.2-6.el7_9.1                updates          92 k
 centos-logos         noarch         70.0.6-3.el7.centos            base             21 M
 httpd-tools          x86_64         2.4.6-99.el7.centos.1          updates          94 k
 mailcap              noarch         2.1.41-2.el7                   base             31 k

Transaction Summary
==========================================================================================
Install  1 Package (+5 Dependent packages)

Total download size: 24 M
Installed size: 32 M
Downloading packages:
(1/6): apr-1.4.8-7.el7.x86_64.rpm                                  | 104 kB  00:00:00     
(2/6): apr-util-1.5.2-6.el7_9.1.x86_64.rpm                         |  92 kB  00:00:00     
(3/6): mailcap-2.1.41-2.el7.noarch.rpm                             |  31 kB  00:00:00     
(4/6): httpd-tools-2.4.6-99.el7.centos.1.x86_64.rpm                |  94 kB  00:00:00     
(5/6): httpd-2.4.6-99.el7.centos.1.x86_64.rpm                      | 2.7 MB  00:00:00     
(6/6): centos-logos-70.0.6-3.el7.centos.noarch.rpm                 |  21 MB  00:00:00     
------------------------------------------------------------------------------------------
Total                                                      32 MB/s |  24 MB  00:00:00     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : apr-1.4.8-7.el7.x86_64                                                 1/6 
  Installing : apr-util-1.5.2-6.el7_9.1.x86_64                                        2/6 
  Installing : httpd-tools-2.4.6-99.el7.centos.1.x86_64                               3/6 
  Installing : centos-logos-70.0.6-3.el7.centos.noarch                                4/6 
  Installing : mailcap-2.1.41-2.el7.noarch                                            5/6 
  Installing : httpd-2.4.6-99.el7.centos.1.x86_64                                     6/6 
  Verifying  : httpd-tools-2.4.6-99.el7.centos.1.x86_64                               1/6 
  Verifying  : mailcap-2.1.41-2.el7.noarch                                            2/6 
  Verifying  : apr-1.4.8-7.el7.x86_64                                                 3/6 
  Verifying  : httpd-2.4.6-99.el7.centos.1.x86_64                                     4/6 
  Verifying  : apr-util-1.5.2-6.el7_9.1.x86_64                                        5/6 
  Verifying  : centos-logos-70.0.6-3.el7.centos.noarch                                6/6 

Installed:
  httpd.x86_64 0:2.4.6-99.el7.centos.1                                                    

Dependency Installed:
  apr.x86_64 0:1.4.8-7.el7                    apr-util.x86_64 0:1.5.2-6.el7_9.1           
  centos-logos.noarch 0:70.0.6-3.el7.centos   httpd-tools.x86_64 0:2.4.6-99.el7.centos.1  
  mailcap.noarch 0:2.1.41-2.el7              

Complete!
# open /etc/httpd/conf/http.conf file in vi editor
[root@stapp01 ~]# vi /etc/httpd/config/httpd.config
[root@stapp01 ~]# vi /etc/httpd/httpd.config
[root@stapp01 ~]# vi /etc/httpd/httpd.conf
[root@stapp01 ~]# vi /etc/httpd/conf/httpd.conf

# replace Listen port with 8088, save and close an editor

Listen 8088

#start and enable httpd
[root@stapp01 ~]# systemctl start httpd
[root@stapp01 ~]# systemctl enable httpd
Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.

#check the status  of the httpd
[root@stapp01 ~]# systemctl status httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: active (running) since Sat 2023-06-10 01:33:45 UTC; 19s ago
     Docs: man:httpd(8)
           man:apachectl(8)
 Main PID: 675 (httpd)
   Status: "Total requests: 0; Current requests/sec: 0; Current traffic:   0 B/sec"
   CGroup: /docker/e9523c75584fd5fc58595d2be66720236a4a413167b285dd3435279d0c26d8d0/system.slice/httpd.service
           ├─675 /usr/sbin/httpd -DFOREGROUND
           ├─676 /usr/sbin/httpd -DFOREGROUND
           ├─677 /usr/sbin/httpd -DFOREGROUND
           ├─678 /usr/sbin/httpd -DFOREGROUND
           ├─679 /usr/sbin/httpd -DFOREGROUND
           └─680 /usr/sbin/httpd -DFOREGROUND

Jun 10 01:33:45 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: got STATUS=P...
Jun 10 01:33:53 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service changed dead ...
Jun 10 01:33:54 stapp01.stratos.xfusioncorp.com systemd[1]: Got notification message fo...
Jun 10 01:33:54 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: Got notifica...
Jun 10 01:33:54 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: got READY=1
Jun 10 01:33:54 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: got STATUS=T...
Jun 10 01:34:04 stapp01.stratos.xfusioncorp.com systemd[1]: Got notification message fo...
Jun 10 01:34:04 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: Got notifica...
Jun 10 01:34:04 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: got READY=1
Jun 10 01:34:04 stapp01.stratos.xfusioncorp.com systemd[1]: httpd.service: got STATUS=T...
Hint: Some lines were ellipsized, use -l to show in full.

# 2. switch to /var/www/html directory
[root@stapp01 ~]# cd /var/www/html
# create index.html file
[root@stapp01 html]# touch index.html
#open index .html file and add the content
[root@stapp01 html]# vi index.html
[root@stapp01 html]# cat index.html
Welcome to the xFusionCorp Industries!


#3 again open /etc/httpd/conf/httpd.conf in vi editor
[root@stapp01 /]# vi /etc/httpd/conf/httpd.conf
[root@stapp01 /]# vi /etc/httpd/conf/httpd.conf

# add header with these content a very last



# Header set X-XSS-Protection "1; mode=block
Header always append X-Frame-Options SAMEORIGIN
Header set X-Content-Type-Option nosniff

# restart httpd service
[root@stapp01 /]# systemctl restart httpd

# check for the status using curl command 
[root@stapp01 /]# curl -i  http://localhost:8088
HTTP/1.1 200 OK
Date: Sat, 10 Jun 2023 01:44:19 GMT
Server: Apache/2.4.6 (CentOS)
X-Frame-Options: SAMEORIGIN
Last-Modified: Sat, 10 Jun 2023 01:36:26 GMT
ETag: "27-5fdbc8393171d"
Accept-Ranges: bytes
Content-Length: 39
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: text/html; charset=UTF-8

Welcome to the xFusionCorp Industries!
[root@stapp01 /]# exit 