# Task-03 Linux TimeZones Setting

# exercise: During the daily standup, it was pointed out that the timezone across Nautilus Application Servers in Stratos Datacenter doesn't match with that of the local datacenter's timezone, which is America/Blanc-Sablon.


# login to all app servers as a sudo user
 sudo su -

# verify current time-zone using #timedatectl  
[root@localhost ~]# timedatectl
      Local time: Mon 2023-06-19 20:43:30 IST
  Universal time: Mon 2023-06-19 15:13:30 UTC
        RTC time: Mon 2023-06-19 20:43:31
       Time zone: Asia/Kolkata (IST, +0530)
     NTP enabled: yes
NTP synchronized: no
 RTC in local TZ: yes
      DST active: n/a

Warning: The system is configured to read the RTC time in the local time zone.
         This mode can not be fully supported. It will create various problems
         with time zone changes and daylight saving time adjustments. The RTC
         time is never updated, it relies on external facilities to maintain it.
         If at all possible, use RTC in UTC by calling
         'timedatectl set-local-rtc 0'.
# timedatectl -h 
[root@localhost ~]# timedatectl -h

# use set-timezone parameter and add respective time zone country/state
[root@localhost ~]# timedatectl set-timezone America/Blanc-Sablon

# verify with timezonectl, is time zone has chnaged to desired zone or not
[root@localhost ~]# timedatectl
      Local time: Mon 2023-06-19 11:34:32 AST
  Universal time: Mon 2023-06-19 15:34:32 UTC
        RTC time: Mon 2023-06-19 11:34:32
       Time zone: America/Blanc-Sablon (AST, -0400)
     NTP enabled: yes
NTP synchronized: no
 RTC in local TZ: yes
      DST active: n/a

Warning: The system is configured to read the RTC time in the local time zone.
         This mode can not be fully supported. It will create various problems
         with time zone changes and daylight saving time adjustments. The RTC
         time is never updated, it relies on external facilities to maintain it.
         If at all possible, use RTC in UTC by calling
         'timedatectl set-local-rtc 0'.

#exit and logout

 exit

 logout
          

