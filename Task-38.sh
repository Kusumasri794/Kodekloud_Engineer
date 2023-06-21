# install and configure tomcat server

# The Nautilus application development team recently finished the beta version of one of their Java-based applications, which they are planning to deploy on one of the app servers in Stratos DC. After an internal team meeting, they have decided to use the tomcat application server. Based on the requirements mentioned below complete the task:
# a. Install tomcat server on App Server 1 using yum.
# b. Configure it to run on port 6200.
# c. There is a ROOT.war file on Jump host at location /tmp. Deploy it on this tomcat server and make sure the webpage works directly on base URL i.e without specifying any sub-directory anything like this http://URL/ROOT .

# switch to app server 1 with it's credentials and root to sudo user
jump_host@thor: ssh tony@stapp01
jump_host@thor: Passowrd
tony@stapp01: sudo su -

#step a: install tomcat package
root@stapp01: yum install tomcat -y

#verify tomcat package
root@stapp01: rpm -qa |grep tomcat

#step b. open server.xml file in vi editor to configure port:6200
root@stapp01: vi /ect/tomcat/server.xml
 # look for "Connector Port" and update with respective port, save and exit from it
     <Connector port="6200" protocol="HTTP/1.1"
            connectionTimeout="20000"
            redirectPort="8443" />
     :wq and exit
 
 
 #step c: switch to jump host to copy ROOT.war file into app server 1
 # copy using SCP /tmp/ROOT.war to stapp01 server
jump_host@thor: scp /tmp/ROOT.war tony@stapp01:/tmp
jump_host@thor: enter tony password:


# switch to app server 1 and root to sudo su -
jump_host@thor:ssh tony@stapp01
tony@stapp01: sudo su -

# verify tmp directory and move ROOT.war file from /tmp to tomcat directory
root@stapp01: cd /tmp
root@stapp01/tmp: mv ROOT.war /var/lib/tomcat/webapps/
root@stapp01:cd ..

# restart and verify tomcat server status
root@stapp01: systemctl restart tomcat
root@stapp01: systemctl status tomcat

#verify the app server url with curl commant

root@stapp01: curl -I http://172.16.238.10:6002
     https: 200 ok
root@stapp01: curl http://172.16.238.10:6002  

root@stapp01: exit
root@stapp01: logout