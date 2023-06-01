#Create a Cron Job
#The Nautilus system admins team has prepared scripts to automate several day-to-day tasks. They want them to be deployed on all app servers in Stratos DC on a set schedule. Before that 
#they need to test similar functionality with a sample cron job. Therefore, perform the steps below:
#a. Install cronie package on all Nautilus app servers and start crond service.

#b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root #

#Solution: Same process has been done in all 3 servers
# Login to app server 1 as a sudo user and installed cronie package
[root@stapp03 ~]# yum install cronie -y

#started a crond service
[root@stapp03 ~]# systemctl start crond.service

#enabled a Crond service
[root@stapp03 ~]# systemctl status crond.service

#opened crontab and added "cron */5 * * * * echo hello > /tmp/cron_text" into it( inserted and saved in VIM editor)
[root@stapp03 ~]# crontab -e
no crontab for root - using an empty one
crontab: installing new crontab

#list down crontab output
[root@stapp03 ~]# crontab -l
*/5 * * * * echo hello > /tmp/cron_text

#list down crontab output as a root user
[root@stapp03 ~]# crontab -u root -l
*/5 * * * * echo hello > /tmp/cron_text
[root@stapp03 ~]# history
[root@stapp03 ~]# exit