                这是saltstack自动部署fail2ban的sls文件
1. 将infail2ban.sls文件和fail2ban目录 复制到/srv/salt目录下（yum 安装salt-master）
2. 修改top.sls文件，添加fail2ban
执行模块：salt '*'  state.sls fail2ban
                关于fail2ban
1. 默认已经运行
2. 使用iptable来禁掉攻击者的ip，确保iptable运行
3. 默认5分钟检测一次，如果超过3此登陆失败那么该登陆者ip将被禁止1个小时登陆（如需修改，请修改配置文件jail.conf）
4.如需管理进程：
./etc/init.d/fail2ban start|stop|status|restart