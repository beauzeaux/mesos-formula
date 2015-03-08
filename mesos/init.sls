{% from "mesos/map.jinja" import mesos with context %}
{% set mesos_download_dir='/tmp/mesos-build' %}

mesos-deps:
  pkg.installed:
    - pkgs:
      - build-essential
      - openjdk-7-jdk
      - python-dev
      - python-boto
      - libcurl4-nss-dev
      - libsasl2-dev
      - maven
      - libapr1-dev
      - libsvn-dev

# ensure that the mesos is downloaded and installed 
mesos:
  pkgrepo.managed:
    - humanname: Mesosphere PPA
    - name: deb http://repos.mesosphere.io/ubuntu trusty main
    - dist: trusty
    - file: /etc/apt/sources.list.d/mesosphere.list
    - keyid: E56151BF
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mesos

  pkg.installed:
    - pkgs:
      - mesos


/etc/init/mesos-master.conf:
  file.managed:
    - source: salt://mesos/templates/mesos-master.conf.template
    - template: jinja

/etc/init/mesos-slave.conf:
  file.managed:
    - source: salt://mesos/templates/mesos-slave.conf.template
    - template: jinja