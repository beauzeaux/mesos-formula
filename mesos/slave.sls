{% from "mesos/map.jinja" import mesos with context %}

include: 
  - mesos/mesos-common

mesos-slave:
  service.running:
    - name: mesos-slave

/etc/mesos/zk:
  file.managed:
    - user: root
    - mode: 655
    - template: salt://mesos/templates/zk.template
