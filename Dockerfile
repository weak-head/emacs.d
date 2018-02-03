FROM ubuntu:17.10
MAINTAINER Oleksandr Zinchenko "zinchenko@live.com"

# install emacs-nox
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        emacs25-nox \

# install dependencies
    && apt-get install -y \
                gcc \
                libc6-dev \
                libffi-dev \
                libgmp-dev \
                libncurses5-dev \
                libncursesw5-dev \
                build-essential \
                zlib1g-dev \
                wget \
                curl \
                git \
                silversearcher-ag \

# cleanup
    && apt-get clean \
    && rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

# haskell && stack
RUN curl -sSL https://get.haskellstack.org/ | sh

# add emacs configuration
COPY init.el           /root/.emacs.d/
COPY packages          /root/.emacs.d/packages
COPY external-modules  /root/.emacs.d/external-modules

# trigger the package initialization
RUN emacs --daemon

# overwrite this with 'CMD []' in dependent file
CMD ["/bin/bash"]
