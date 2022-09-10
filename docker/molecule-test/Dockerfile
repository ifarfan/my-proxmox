FROM ubuntu:20.04
LABEL maintainer "Ur boi Izzy <ifarfan@gmx.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Fix timezone issue
ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Default pkgs
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      apt-utils \
      curl \
      gcc \
      git \
      gnupg \
      libssl-dev \
      python3 \
      python3-apt \
      python3-dev \
      python3-pip \
      python3-setuptools \
      sudo \
      unzip && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{cache,log}/

# goss
RUN curl -Ls "https://github.com/aelsabbahy/goss/releases/latest/download/goss-linux-amd64" -o /usr/local/bin/goss && \
    chmod 0755 /usr/local/bin/goss

# aws cli v2
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip ./aws

# systemd requirements
ENV SHELL="/bin/bash"
ENV container="docker"
ENV LC_ALL="C"
ENV DEBIAN_FRONTEND="noninteractive"

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      systemd \
      systemd-sysv && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{cache,log}/

RUN find /lib/systemd/system/sysinit.target.wants/ -type l -not -path '*systemd-tmpfiles-setup*' -delete

RUN rm -f /etc/systemd/system/*.wants/* \
    /lib/systemd/system/anaconda.target.wants/* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/multi-user.target.wants/* \
    /lib/systemd/system/plymouth* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
