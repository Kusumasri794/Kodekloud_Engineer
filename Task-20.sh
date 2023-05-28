thor@jump_host ~$ ssh groot@172.16.238.17
The authenticity of host '172.16.238.17 (172.16.238.17)' can't be established.
ECDSA key fingerprint is SHA256:lLe44W9wOU4zGNPS7r4cpzFt+Qi40fMZrBUQes0OA0c.
ECDSA key fingerprint is MD5:b0:fe:af:74:52:f1:24:ad:7b:ef:f3:4e:c1:eb:13:35.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.16.238.17' (ECDSA) to the list of known hosts.
groot@172.16.238.17's password: 
Permission denied, please try again.
groot@172.16.238.17's password: 
Permission denied, please try again.
groot@172.16.238.17's password: 
[groot@stmail01 ~]$ sudo su -

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for groot: 

[groot@stmail01 ~]$ sysetmctl start postfix
[groot@stmail01 ~]$ systemctl status postfix
[groot@stmail01 ~]$ cat /etc/postfix/main.cf |grep inet_interface
[groot@stmail01 ~]$ vi /etc/postfix/main.cf

#edit /etc/postfix/main.cf file, comment inet_interface= local host , save and close Vi editor
[groot@stmail01 ~]$ systemctl start postfix
[groot@stmail01 ~]$systemctl status postfix
[groot@stmail01 ~]$ telnet localhost 20
[groot@stmail01 ~]$ exit


