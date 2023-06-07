# Install a package

# Exercise: As per new application requirements shared by the Nautilus project development team, serveral new packages need to be installed on all app servers in Stratos Datacenter. Most of them are completed except for vsftpd. Therefore, install the vsftpd package on all app-servers.


# solution:

ssh tony@stapp01: sudo su -
root@stapp01: rpm -qa
root@stapp01: yum install vnsftd -y

ssh steve@stapp02: sudo su -
steve@stapp02:  rpm -qa
steve@stapp02: yum install vnsftd -y
ssh banner@stapp03: sudo su -
root@stapp03: yum install vnsftd -y
