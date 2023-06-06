
#Linux LogRotate: 
# Exercise: The Nautilus DevOps team is ready to launch a new application, which they will deploy on app servers in Stratos Datacenter. They are expecting significant traffic/usage of haproxy on app servers after that. This will generate massive logs, creating huge log files. To utilise the storage efficiently, they need to compress the log files and need to rotate old logs. Check the requirements shared below:



# a. In all app servers install haproxy package.

# b. Using logrotate configure haproxy logs rotation to monthly and keep only 3 rotated logs.

# (If by default log rotation is set, then please update configuration as needed)



#Solution:
# switch to application server 1 with tony@stapp01 credentials
thor@jump_host ~$ ssh tony@stapp01

#switch to root user
thor@jump_host ~$ sudo su -
#list down with existing log packages
[root@stapp01 ~]ls /etc/logrotate.d
#install haproxy package in app server 1
[root@stapp01 ~] yum install haproxy -y

# update /etc/logrotate.d/haproxy with monthly and rotate to 3
[root@stapp01 ~]vi /etc/logrotate.d/haproxy
#restart haproxy service
[root@stapp01 ~]systemctl restart haproxy
#check status of haproxy
[root@stapp01 ~]systemctl status haproxy

#exit from root user
[root@stapp01 ~]exit
#logout from app server
[root@stapp01 ~]logout

#here same steps has been performed to app server 2 and app server 3
thor@jump_host ~$ ssh steve@stapp02

#switch to root user
thor@jump_host ~$ sudo su -

[root@stapp02 ~]ls /etc/logrotate.d
[root@stapp02 ~] yum install haproxy -y
[root@stapp02 ~]vi /etc/logrotate.d/haproxy
[root@stapp02 ~]systemctl restart haproxy
[root@stapp02 ~]systemctl status haproxy
[root@stapp02 ~]exit
[root@stapp02 ~]logout
   
thor@jump_host ~$ ssh banner@stapp03

[root@stapp03 ~]ls /etc/logrotate.d
[root@stapp03 ~] yum install haproxy -y
[root@stapp03 ~]vi /etc/logrotate.d/haproxy
[root@stapp03 ~]systemctl restart haproxy
[root@stapp03 ~]systemctl status haproxy
[root@stapp03 ~]exit
[root@stapp03 ~]logout   


