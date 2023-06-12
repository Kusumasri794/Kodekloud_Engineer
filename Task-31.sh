# Task-31 Linux Bash Scripts

# The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day to day tasks. One is to create a bash script for taking websites backup. They have a static website running on App Server 1 in Stratos Datacenter, and they need to create a bash script named media_backup.sh which should accomplish the following tasks. (Also remember to place the script under /scripts directory on App Server 1)

# a. Create a zip archive named xfusioncorp_media.zip of /var/www/html/media directory.
# b. Save the archive in /backup/ on App Server 1. This is a temporary storage, as backups from this location will be clean on weekly basis. Therefore, we also need to save this backup archive on Nautilus Backup Server.
# c. Copy the created archive to Nautilus Backup Server server in /backup/ location.
# d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.

# Solution:

#login to app server 1 with credentials and swith to sudo user and switch to /scripts directory
sudo su -
cd /scripts

# create media_backup.sh file open it in vi editor
vi /scripts/media_backup.sh

# enter below commands in media_backup.sh file, esc, :wq and exit
zip /backup/xfusioncorp_media.zip /var/www/html/media
scp /backup/xfusioncorp_media.zip clint@spbk01:/backup/

#generate public and private key to login to back up server with out password
# ssh -keygen to generate publick key
ssh-keygen
#copy akey details with backup server
ssh-copy-id clint@stpbk011
password@clint: 

#verify to login to back up server without password and exit from it.
ssh clint@stpbk01
exit 0

# update +x execution permission to media_backup.sh file and run the file
chmod +x media_backup.sh
./media_backup.sh

#exit , logout and verify the output.
exit 
logout

