# Linux Process Troubleshooting
# Exercise: The production support team of xFusionCorp Industries has deployed some of the latest monitoring tools to keep an eye on every service, application, etc. running on the systems. One of the monitoring systems reported about Apache service unavailability on one of the app servers in Stratos DC.
# Identify the faulty app host and fix the issue. Make sure Apache service is up and running on all app hosts. They might not hosted any code yet on these servers so you need not to worry about if Apache isn't serving any pages or not, just make sure service is up and running. Also, make sure Apache is running on port 5003 on all app servers.

# Verify all server is application is up and running fine
 thor@jump_hos#:curl http://172.16.238.10:5003
            Refused to connect
 thor@jump_hos: curl http://172.16.238.11:5003
            http:200 OK
 thor@jump_hos: curl http://172.16.238.12:5003 
            http: 200 OK
# Here in my scenario, there is an issue with app server 1 so need to login to app01 with it's credentisla

root@app01: sudo su -

# verify is httpd package is existing or not
root@app01: rpm -qa |grep httpd

# verify httpd status and try to restart 
root@app01:systemctl status httpd
root@app01:systemctl restart httpd

# check where is an error using netstat and grep with respective port IF
root@app01: netstat -tulnp |grep 5003
  tcp  0    0 127.0.0.1:5300  0.0.0.0:*    LISTEN   503/sendmail: accep

# here is a problem with process ID : 503 , so need to kill a process and verify once again
root@app01: kill 503
root@app01:netstat -tunlp |grep 5003
# restart httpd and verify the status and check using curl command
root@app01: systemctl start httpd
root@app01: systemctl status httpd
root@app01: curl http://172.16.238.10:5003
    https: 200 ok
root@app01: quit    
     

