FROM ubuntu:16.04
MAINTAINER Oleksandr Zinchenko "zinchenko@live.com"

RUN apt-get update && apt-get install -y emacs24-nox

COPY emacs.d/ /root/.emacs.d/
CMD ["/bin/bash"]
