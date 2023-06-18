# Application Security

# Exercise: We have a backup management application UI hosted on Nautilus's backup server in Stratos DC. That backup management application code is deployed under Apache on the backup server itself, and Nginx is running as a reverse proxy on the same server. 
#Apache and Nginx ports are 5001 and 8094, respectively. We have iptables firewall installed on this server. Make the appropriate changes to fulfill the requirements mentioned below:
#We want to open all incoming connections to Nginx's port and block all incoming connections to Apache's port. Also make sure rules are permanent.

# solution:

#login to backup server and root to sudo user
ssh clint@stbkp01
sudo su -
#verify apache and nginx packages
rpm -qa |grep apache
rpm -qa |grep nginx

# verify the status of iptables

systemctl status iptables

# add optable rules assign 5001 prot to accept a request and 8094 to reject all nginx request.
sudo iptables -A INPUT -p tcp --dport 5001 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8094 -m conntrack --ctstate NEW -j REJECT

# save itables into /etc/sysconfig/itables path
sudo iptables-save > /etc/sysconfig/iptables

#verify itables again 
cat /etc/sysconfig/iptables
systemctl status iptables

#verify with telnet and close and exit the server.

telnet stbp01 5001

telnet stbp01 8094




