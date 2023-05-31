# Create a Linux User with non-interactive shell

ssh user@login
password:
sudo su -   # switch to root user
id john
useradd john -s /sbin/nologin
cat /etc/passwrd
grep john