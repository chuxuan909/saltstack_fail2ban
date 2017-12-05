#!/bin/bash
SSH_PORT=$(netstat -tunlnp|grep sshd|grep 0.0.0.0|awk -F: '{print $2}'|awk '{print $1}')
python -V
[ ! $? -eq 0 ] && yum -y install python
tar -zxvf /opt/fail2ban_install/fail2ban-0.8.14.tar.gz -C /opt/fail2ban_install
cd /opt/fail2ban_install/fail2ban-0.8.14
python setup.py install
cp files/redhat-initd /etc/init.d/fail2ban
sed -i  '96s/false/true/' /etc/fail2ban/jail.conf
sed -i  '98s/port=ssh/port='$SSH_PORT'/' /etc/fail2ban/jail.conf
sed -i  's/port = ssh/port = '$SSH_PORT'/' /etc/fail2ban/action.d/iptables.conf
sed -i  '100s#/var/log/sshd.log#/var/log/secure#' /etc/fail2ban/jail.conf
sed -i  '101s/5/3/' /etc/fail2ban/jail.conf
sed -i  '102s/^.*/findtime = 300/' /etc/fail2ban/jail.conf
sed -i  '103s/^.*/bantime = 3600/' /etc/fail2ban/jail.conf
/etc/init.d/fail2ban start
