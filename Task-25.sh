
# Configure Local Yum repos

# Exercise: The Nautilus production support team and security team had a meeting last month in which they decided to use local yum repositories for maintaing packages needed for their servers. For now they have decided to configure a local yum repo on Nautilus Backup Server. This is one of the pending items from last month, so please configure a local yum repository on Nautilus Backup Server as per details given below.



# a. We have some packages already present at location /packages/downloaded_rpms/ on Nautilus Backup Server.

# b. Create a yum repo named yum_local and make sure to set Repository ID to yum_local. Configure it to use package's location /packages/downloaded_rpms/.

# c. Install package vim-enhanced from this newly created repo.

# solution:

# step: 1 connect to ssh back up client

clint@stbkp01: sudo su -

# step: 2 check the repository list
root@stbkp01: yum repolist

# create and switch to /etc/yum.repos.d direcoty

root@stbkp01: cd /etc/yum.repos.d
# create yum_local.repo and open it via VI editor
root@stbkp01: vi /etc/yum.repos.d/yum_local.repo

# created yum_local file with below content, save and exit from vi editor

  [yum_local]
  name=yum_local
  baseurl=file:///packages/downloaded_rpms/
  enabled = 1
  gpgcheck = 0

# check the repo list 
root@stbkp01: yum repolist

# clear existing repos
root@stbkp01: yum clear all

# install vim-enahanced packages
root@stbkp01: yum install vim-enhanced -y

# exit from root user 
clint@stbkp01: exit

# logout from the back up server
clint@stbkp01: logout