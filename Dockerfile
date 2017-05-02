FROM ubuntu:16.04

MAINTAINER Oleksandr Zinchenko "zinchenko@live.com"

RUN apt-get update
RUN apt-get install -y emacs24-nox

COPY emacs.d/ /home/root/.emacs.d/
