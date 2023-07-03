# Puppet Setup Database
# Exercise: The Nautilus DevOps team had a meeting with development team last week to discuss about some new requirements for an application deployment. Team is working on to setup a mariadb database server on Nautilus DB Server in Stratos Datacenter. They want to setup the same using Puppet. Below you can find more details about the requirements:

# Create a puppet programming file cluster.pp under /etc/puppetlabs/code/environments/production/manifests directory on puppet master node i.e on Jump Server. Define a class mysql_database in puppet programming code and perform below mentioned tasks:
# Install package mariadb-server (whichever version is available by default in yum repo) on puppet agent node i.e on DB Server also start its service.
# Create a database kodekloud_db2 , a database userkodekloud_rin and set passwordBruCStnMT5 for this new user also remember host should be localhost. Finally grant some usual permissions like select, update (or full) ect to this newly created user on newly created database.
# Notes: :- Please make sure to run the puppet agent test using sudo on agent nodes, otherwise you can face certificate issues. In that case you will have to clean the certificates first and then you will be able to run the puppet agent test.

# :- Before clicking on the Check button please make sure to verify puppet server and puppet agent services are up and running on the respective servers, also please make sure to run puppet agent test to apply/test the changes manually first.

# :- Please note that once lab is loaded, the puppet server service should start automatically on puppet master server, however it can take upto 2-3 minutes to start.


#solution1:

 # step 1 in Jumphost server, switch to sudo user 

 sudo su -

cd /etc/puppetlabs/code/environments/production/manifests

vi cluster.pp
      node 'stdb01.stratos.xfusioncorp.com' {
      include mysql_database
      }

      class mysql_database {
        package {'mariadb-server':
         ensure => installed,
        }
  
        service { 'mariadb':
           ensure => running,
           enable => true,
  
        }
    
        mysql::db { 'kodekloud_db2':
        user => 'userkodekloud_rin',
        password => 'BruCStnMT5',
        host => 'localhost',
        grant => ['ALL'],
        }
    }
# save and exit from vi edito

#verify puppet package

puppet parser validate cluster.pp


#step : 2 in open other terminal and login to DB server and switch to sudo user

sudo su -

# vetify mariadb status

systemctl status maria db
# run puppet agent
puppet agent -tv

#login to maria db
mysql -u userkodekloud_rin -p kodekloud_db2 -h localhost

# enter password

#exit an verify the task




