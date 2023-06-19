# Task-34 Setup SSL for Nginx
#Exercise: The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 2 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:
#Install and configure nginx on App Server 2.
#On App Server 2 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.
#Create an index.html file with content Welcome! under Nginx document root.
#For final testing try to access the App Server 2 link (either hostname or IP) from jump host using curl command. For example curl -Ik https://<app-server-ip>/.


#  Solution: Login to Appserver e and switch to root user

sudo su -

# Install epel-release and nginx packages
yum install epel-release -y
yum install nginx -y

#start and enable nginx service
systemctl start nginx
systemctl status nginx

# cat to /etc/nginx/nginx.conf
cd /etc/nginx

# open nginx.conf file in vi editor and do necessary chnages
vi nginx.conf

# look for server function and add server name
  server name 172.16.238.11 ;

# scroll down and look for SSL_certificate and SSL certificate key add path like below and un comment full function save and close vi editor
  ssl_certificate "/etc/pki/CA/certs/nautilus.crt"
  ssl_certificate_key "etc/pki/CA/private/nautilus.key"

#restart nginx and check status 
systemctl restart nginx
systemctl status nginx

#copy nautilus.crt and nautilus.key to respective paths
cp /tmp/nautilus.crt  etc/pki/CA/certs/
cp /tmp/nautilus.key etc/pki/CA/private/

#verify a certificates
cat etc/pki/CA/certs/
cat etc/pki/CA/private/

# switch to Nginx root path, remove existing index.html file and create a new file and comment into it.
cd /usr/share/nginx/html
ls -l |grep index.html

rm -rf index.html

vi index.html

  Welcome!

#verify index.html
cat index.html

#verify the nginx via server 2 app., look for out put http 200 ok., 
curl -Ik https://stapp02/

200 ok
#switch to jump host and verify 
curl -Ik https://stapp02/

200 ok

#exit and logout.
exit
logout


