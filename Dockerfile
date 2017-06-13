FROM ubuntu:17.10
MAINTAINER Oleksandr Zinchenko "zinchenko@live.com"


# install emacs-nox
RUN \
  apt-get update && \
  apt-get install -y \
         emacs25-nox && \

# cleanup
  apt-get clean && \
  rm -rf \
         /tmp/* \
         /var/lib/apt/lists/* \
         /var/tmp/*

# add emacs config
COPY ./ /root/.emacs.d/

# overwrite this with 'CMD []' in dependent file
CMD ["/bin/bash"]
