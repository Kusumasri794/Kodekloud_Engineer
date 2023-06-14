# Task-33 Web Server Security

# Exercise:  During a recent security audit, the application security team of xFusionCorp Industries found security issues with the Apache web server on Nautilus App Server 2 server in Stratos DC. They have listed several security issues that need to be fixed on this server. Please apply the security settings below:
# a. On Nautilus App Server 2 it was identified that the Apache web server is exposing the version number. Ensure this server has the appropriate settings to hide the version number of the Apache web server.
# b. There is a website hosted under /var/www/html/official on App Server 2. It was detected that the directory /official lists all of its contents while browsing the URL. Disable the directory browser listing in Apache config.
# c. Also make sure to restart the Apache service after making the changes.

# Solution:

# step:1 Login to server 2 and switch to root user

sudo su -

# verify httpd.conf file with Indexes , ServerTokens, ServerSignature keywords
cat /etc/httpd/conf/httpd.conf |grep Indexes
cat /etc/httpd/conf/httpd.conf |grep ServerTokens
cat /etc/httpd/conf/httpd.conf |grep ServerSignature

# open a .conf file in vi editor add serverTokens and SErverSignature at very last and remove Indexes Options FollowsymLinks line from the file and save it
vi /etc/httpd/conf/httpd.conf
  
  # search for Indexes  and delete Indexes for line (Not comment line wich has Index) 
   Options FollowSymLinks 
  # at the dead end of the file add ServerToken and ServerSignature

  ServerTokens Prod
  ServerSignature off

# verify config file with key words 
cat /etc/httpd/conf/httpd.conf |grep Indexes
cat /etc/httpd/conf/httpd.conf |grep ServerTokens
cat /etc/httpd/conf/httpd.conf |grep ServerSignature

# restart httpd servive and check a status
systemctl restart httpd
systemctl status httpd

# verify directory browser listing in Apache config

curl -i http://stapp02:8080
curl -i http://stapp02:8080/officials

# verify a code and exit
exit