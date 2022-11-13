FROM ubuntu:22.04
LABEL maintainer "Ur boi <ifarfan@gmx.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# # Fix timezone issue
# ENV TZ=Etc/UTC
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Default pkgs
ENV DEBIAN_FRONTEND="noninteractive"
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      git \
      gpg-agent \
      python3 \
      python3-pip \
      software-properties-common \
      unzip && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,cache,log}/

# HashiCorp tools:
# - packer
# - terraform
ARG PACKER_VER=1.8.3
ARG TERRAFORM_VER=1.3.4
RUN curl -fsSL "https://apt.releases.hashicorp.com/gpg" | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      packer=${PACKER_VER} \
      terraform=${TERRAFORM_VER} && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,cache,log}/

# pip tools:
# - ansible-lint (ansible linter)
# - checkov (terraform scanner)
# - trufflehog3 (git secrets scanner)
# - yamllint (duh!)
ARG ANSIBLELINT_VER=4.0
ARG CHECKOV_VER=2.0
ARG TRUFFLEHOG3_VER=2.0
ARG YAMLLINT_VER=1.0
RUN pip3 install --no-cache-dir \
      ansible-lint~=${ANSIBLELINT_VER} \
      checkov~=${CHECKOV_VER} \
      trufflehog3~=${TRUFFLEHOG3_VER} \
      yamllint~=${YAMLLINT_VER}

# miscellaneous tools:
# - tflint (terraform linter: latest version)
# - hadolint (dockerfile linter + shell scanner: latest version)
# - dockler (docker security scanner)
RUN curl -Ls "$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip && \
    unzip tflint.zip && \
    rm tflint.zip && \
    mv tflint /usr/local/bin/ && \
    curl -Ls "$(curl -Ls https://api.github.com/repos/hadolint/hadolint/releases/latest | grep -o -E "https://.+?-Linux-x86_64")" -o /usr/local/bin/hadolint && \
    chmod 0755 /usr/local/bin/hadolint && \
    VERSION=$(curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/') && \
    curl -Ls "https://github.com/goodwithtech/dockle/releases/download/v${VERSION}/dockle_${VERSION}_Linux-64bit.deb" -o dockle.deb && \
    dpkg -i dockle.deb && \
    rm dockle.deb
