# Task-04 Linux String Substitute (sed)

# exercise: There is some data on Nautilus App Server 1 in Stratos DC. Data needs to be alteredin several of the files. On Nautilus App Server 1, alter the /home/BSD.txt file as per details given below:
# a. Delete all lines containing word software and save results in /home/BSD_DELETE.txt file. (Please be aware of case sensitivity)
# b. Replace all occurrence of word the to their and save resultsin /home/BSD_REPLACE.txt file.
# Note: Lets say you are asked to replace word to with from. In that case, make sure not to alter any words containing this string; for example upto, contributor etc.

# login to app server 1 and switch to sudo user

  sudo su -

  cat /home/BSD.txt |grep software

  sed '/\<software\>/d' /home/BSD.txt >/home/BSD_DELETE.txt
  cat /home/BSD_DELETE.txt

  sed 's/\bthe\b/their/g' /home/BSD.txt > /home/BSD_REPLACE.txt

  cat /home/BSD_REPLACE.txt | grep the
  cat /home/BSD_REPLACE.txt |grep their

  exit 

  logout







