#Linux Find Command

#During a routine security audit, the team identified an issue on the Nautilus App Server. Some malicious content was identified within the website code. After digging into the issue they found that there might be more infected files. Before doing a cleanup they would like to find all similar files and copy them to a safe location for further investigation. Accomplish the task as per the following requirements:
#a. On App Server 2 at location /var/www/html/official find out all files (not directories) having .css extension.
#b. Copy all those files along with their parent directory structure to location /official on same server.
#c. Please make sure not to copy the entire /var/www/html/official directory content.

#login to app server 2 and switch to root
sudo su -

#find .css files in /var/www/html/official directory  and copy all files in to Official folders
find /var/www/html/official -type f -name '*.css' --exec cp --parents {} /official \;

# list down all .css files
ll /var/www/html/official

# exit from app server 2
exit


