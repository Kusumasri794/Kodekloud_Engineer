# Install and Configure PostgreSQL

# Exercise: The Nautilus application development team has shared that they are planning to deploy one newly developed application on Nautilus infra in Stratos DC. The application uses PostgreSQL database, so as a pre-requisite we need to set up PostgreSQL database server as per requirements shared below:
# a. Install and configure PostgreSQL database on Nautilus database server.
# b. Create a database user kodekloud_pop and set its password to dCV3szSGNA.
# c. Create a database kodekloud_db5 and grant full permissions to user kodekloud_pop on this database.
# d. Make appropriate settings to allow all local clients (local socket connections) to connect to the kodekloud_db5 database through kodekloud_pop user using md5 method (Please do not try to encrypt password with md5sum).
# e. At the end its good to test the db connection using these new credentials from root user or server's sudo user.

#solution: 
 #Step:a Install postgresql-server an postgresql-contrib packages using Yum command

 Thor@jump_host# ssh peter@stdb01
 Thor@jump_host# Enter DB pasword:
 peter@stdb01# sudo su -
 peter@stdb01# enter DB password
 root@stdb01# yum install postgresql-service postgresql-contrib

 # Step:a Configure postgresql, start, enable postgres service

 postgresql-setup initdb

 sysetmctl start postgresql
 systemctl enable postgresql
 systemctl status postgresql

 # Step:b Create a database user kodekloud_pop and set its password to dCV3szSGNA

 sudo -u postgres psql
 CREATE USER  kodekloud_pop WITH PASSWORD 'dCV3szSGNA';

# Step:c Create a database kodekloud_db5 and grant full permissions to user kodekloud_pop on this database

CREATE DATABASE kodekloud_db5 ;
GRANT ALL PRIVILAGES ON DATABASE kodekloud_db5 TO kodekloud_pop;
\q

# Step:d  Make appropriate settings to allow all local clients (local socket connections) to connect to the kodekloud_db5 database through kodekloud_pop user using md5 method (Please do not try to encrypt password with md5sum)

vi /var/lib/pgsql/data/postgres.conf
  
  # uncomment below line

    listen_addresses = 'localhost' 

vi /var/lib/pgsql/data/pg_hba.conf

   # update md5 method to local and host command(which is located at very last)

        local all all md5

        host all all 127.0.0.1/32 md5 
# Step:e At the end its good to test the db connection using these new credentials from root user or server's sudo user.
systemctl restart postgresql
systemctl status postgresql

psql -U kodekloud_pop -d kodekloud_db5 -h 127.0.0.1 -W

Enter kodekloud_pop user password:

 Check users and Roles by using below command.
 \du

 # exit and quit

