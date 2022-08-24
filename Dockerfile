FROM kalilinux/kali-rolling:latest

LABEL website="https://github.com/nostaboo/kali-docker"
LABEL description="Kali Linux with XFCE desktop via VNC and noVNC"

# Install Kali Packages

ARG KALI_METAPACKAGE=core
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade 
RUN apt-get -y install kali-tools-top10
RUN apt-get clean

# Install Kali desktop

ARG KALI_DESKTOP=xfce
RUN apt-get -y install kali-desktop-xfce
RUN apt-get -y install tightvncserver dbus dbus-x11 novnc net-tools

ENV USER root

ENV VNCEXPOSE 0
ENV VNCPORT 5900
ENV VNCPWD TheGaggles  
ENV VNCDISPLAY 1920x1080
ENV VNCDEPTH 16

ENV NOVNCPORT 8080

# Install custom Packages

RUN apt-get -y install python-is-python3
RUN apt-get -y install python3-pip
RUN apt-get -y install python3-virtualenv
RUN apt-get -y install kali-linux-labs
RUN apt-get -y install kali-linux-firmware
RUN apt-get -y install airmon-ng
RUN apt-get -y install airdump-ng
RUN apt-get -y install aireplay-ng
RUN apt-get -y install google-dork
RUN apt-get -y install beef-xss
RUN apt-get -y install wordlists
RUN apt-get -y install hashcat-utils
RUN apt-get -y install sleuthkit
RUN apt-get -y install ssldump
RUN apt-get -y install sslscan
RUN apt-get -y install whois
RUN apt-get -y install windows-binaries

# Entrypoint

COPY entrypoint.sh/entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
