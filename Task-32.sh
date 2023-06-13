# TasK: Apache Redirects

#Exercise: The Nautilus devops team got some requirements related to some Apache config changes. They need to setup some redirects for some URLs. There might be some more changes need to be done. Below you can find more details regarding that: httpd is already installed on app server 3. Configure Apache to listen on port 8082.Configure Apache to add some redirects as mentioned below:
#a.) Redirect http://stapp03.stratos.xfusioncorp.com:<Port>/ to http://www.stapp03.stratos.xfusioncorp.com:<Port>/ i.e non www to www. This must be a permanent redirect i.e 301
# b.) Redirect http://www.stapp03.stratos.xfusioncorp.com:<Port>/blog/ to http://www.stapp03.stratos.xfusioncorp.com:<Port>/news/. This must be a temporary redirect i.e 302.

#login to app server 3 and switch to sudo user
[root@stapp03 ~]#sudo su -

#check httpd is installed or not
[root@stapp03 ~]# rpm-qa |grep httpd

#verify Listen has connected with which port
[root@stapp03 ~]# cat /etc/httpd/conf/httpd.conf |grep Listen

#open httpd.conf file in vim editor and update Listen 8082
[root@stapp03 ~]# vi /etc/httpd/conf/httpd.conf
    Listen 8082
#verify Listen command
[root@stapp03 ~]# cat /etc/httpd/conf/httpd.conf |grep Listen

#now need to update redirection commands in main.conf file., so verify and open main.conf in vim editor
[root@stapp03 ~]# cat /etc/httpd/conf.d
[root@stapp03 ~]#vi /etc/httpd/conf.d/main.conf

#add below commands and save, quit(:wq)
<VirtualHost *:8082>
ServerName http://stapp03.stratos.xfusioncorp.com:8082
Redirect 301 / http://www.stapp03.stratos.xfusioncorp.com:8082
</VirtualHost>

<VirtualHost *:8082>
ServerName http://www.stapp03.stratos.xfusioncorp.com:8082/blog/
Redirect 302 /blog/ http://www.stapp03.stratos.xfusioncorp.com:8082/news/
</VirtualHost>

#restart and check status of httpd
[root@stapp03 ~]# systemctl restart httpd
[root@stapp03 ~]# systemctl status httpd


#verify all 4 url's with curl command
#curl 1
[root@stapp03 ~]# curl http://stapp03.stratos.xfusioncorp.com:8082
#output
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.stapp03.stratos.xfusioncorp.com:8082/">here</a>.</p>
</body></html>
#curl 2
[root@stapp03 ~]# curl http://www.stapp03.stratos.xfusioncorp.com:8082
 Welcome to nautila server

 #curl 3
[root@stapp03 ~]# curl http://www.stapp03.stratos.xfusioncorp.com:8082/blog/
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>302 Found</title>
</head><body>
<h1>Found</h1>
<p>The document has moved <a href="http://www.stapp03.stratos.xfusioncorp.com:8082/news/">here</a>.</p>
</body></html>

#curl 4
[root@stapp03 ~]# curl http://stapp03.stratos.xfusioncorp.com:8082
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="http://www.stapp03.stratos.xfusioncorp.com:3003/">here</a>.</p>
</body></html>
[root@stapp03 ~]#exit
[root@stapp03 ~]#