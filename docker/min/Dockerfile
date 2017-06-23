FROM ubuntu:17.10
MAINTAINER Oleksandr Zinchenko "zinchenko@live.com"

# install emacs-nox
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        emacs25-nox \

# cleanup
    && apt-get clean \
    && rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

# add emacs configuration
COPY init.el   /root/.emacs.d/
COPY init-glob /root/.emacs.d/init-glob
COPY init-pack /root/.emacs.d/init-pack

# trigger the package initialization
RUN emacs --daemon

# overwrite this with 'CMD []' in dependent file
CMD ["/bin/bash"]
