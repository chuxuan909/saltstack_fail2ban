install_snort:
    file.recurse:
      - name: /opt/fail2ban_install
      - source: salt://fail2ban
      - user: root
      - file_mode: 644
      - dir_mode: 755
      - mkdir: True
      - clean: True
    cmd.script:
      - source: salt://fail2ban/fail2ban_env.sh
      - user: root
