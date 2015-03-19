{% from "mesos/map.jinja" import mesos with context %}

include: 
  - mesos/mesos-common

mesos-master:
  service.running:
    - name: mesos-master