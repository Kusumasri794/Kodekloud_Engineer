# Task: Docker Copy Operations
# Exercise: The Nautilus DevOps team has some conditional data present on App Server 2 in Stratos Datacenter. There is a container ubuntu_latest running on the same server. We received a request to copy some of the data from the docker host to the container. 
#Below are more details about the task: n App Server 2 in Stratos Datacenter copy an encrypted file /tmp/nautilus.txt.gpg from docker host to ubuntu_latest container (running on same server) in /usr/src/ location. 
# Please do not try to modify this file in any way.

#solution:

#loging to app server 2 and swith to sudo user
sudo su -

#verify is docker has any container, if yes it is in which status
docker ps -a

# copy /tmp/nautilus.txt.gpg to Ubuntu_latest container's /usr/src/ folder
docker cp /tmp/nautilus.txt.gpg  ubuntu_latest:/usr/src/
# verify is copied file existing in respective folder or not
docker exec -it ubuntu_latest /bin/bash
ls -lrt 

exit 0
logout