#!/bin/sh
# curl https://raw.githubusercontent.com/as/script/master/install-docker-devuan.sh | bash
# This is a one-line install for docker on Devuan (the systemd-free linux distribution).
#
# It installs the cgroupfs mounts
# creates the docker group
# and runs a test container
#
# This doesn't manage the dockerd service. Dockerd pretty-prints log messages to the screen.
# When your system reboots you will have to restart it yourself or create an init file for it.
#
# SECURITY WARNING: Listens on tcp :2375
#

stat /usr/bin/dockerd || (pushd /tmp && apt-get install cgroupfs-mount && curl https://download.docker.com/linux/static/stable/x86_64/docker-17.06.1-ce.tgz > docker.tgz && tar xvzf docker.tgz && mv docker/* /usr/bin && (dockerd -H unix:///var/run/docker.sock -H :2375 & disown) && groupadd docker && docker -v && docker run hello-world; popd)

