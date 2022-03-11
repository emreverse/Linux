{% if grains['os'] == 'Ubuntu' and grains['roles:_service'] == 'kubernetes' %}
init_cmd:
  cmd.run:
    - name: sysctl -w kernel.unprivileged_userns_clone=0
{% endif %}
