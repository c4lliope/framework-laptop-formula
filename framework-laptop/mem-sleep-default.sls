{% from "framework-laptop/map.jinja" import framework with context %}

mem_sleep_default_grub_config:
  file.replace:
    - name: /etc/default/grub
    - pattern: '^GRUB_CMDLINE_LINUX_DEFAULT="\${GRUB_CMDLINE_LINUX_DEFAULT} mem_sleep_default=.*"$'
    - repl: 'GRUB_CMDLINE_LINUX_DEFAULT="${GRUB_CMDLINE_LINUX_DEFAULT} mem_sleep_default={{ framework.mem_sleep_default }}"'
    - append_if_not_found: True

mem_sleep_default_grub_update:
  cmd.run:
    - name: update-grub
    - onchanges:
      - file: mem_sleep_default_grub_config
