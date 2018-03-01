# About

Dockerfile to build a astrosoft image based on Ubuntu.

# How to run

Just type the following commands

```
$ docker run -it -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix shaoguangleo/ubuntu-astrosoft
```

As we all know, the version can be `lateset` or `$ cat VERSION`

# travis

[![Build Status](https://www.travis-ci.org/shaoguangleo/docker-ubuntu-astrosoft.svg?branch=master)](https://www.travis-ci.org/shaoguangleo/docker-ubuntu-astrosoft)
