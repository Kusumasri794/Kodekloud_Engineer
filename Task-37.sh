# IPtables Installation And Configuration

# We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 6000 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:
# Install iptables and all its dependencies on each app host.
# Block incoming port 6000 on all apps for everyone except for LBR host.
# Make sure the rules remain, even after system reboot.

# Login to app server 1 and swithc to sudo

 sudo su -

# Install iptables-service package
 yum install iptables-services -y

# Install iptables package 
yum install iptables -y

# verify status and start iptables
systemctl status iptables
systemctl start iptables

# configure and save IPTables
 iptables -R INPUT 5 -p tcp --dport 6000 -s 72.16.238.14 -j ACCEPT
 iptables -A INPUT -p tcp --dport 6000 -j DROP
 sudo service iptables save

 # verify iptables
 iptables -L --line-numbers

# verify iptables service, stop and restart a service

systectl status iptables
systectl stop iptables
systemctl restart iptbales

# in case of you see any issues, # sudo service iptables save and try restating a iptables service

# same process has done in remaining 2 app servers




