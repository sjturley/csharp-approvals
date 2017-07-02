FROM cyberdojofoundation/alpine_mono:3.4
MAINTAINER Jon Jagger <jon@jaggersoft.com>

COPY packages.config .

RUN  apk add --update openssl \
  && wget http://nuget.org/nuget.exe \
  && mono --runtime=v4.0 nuget.exe restore -PackagesDirectory . \
  && mkdir /nunit \
  && mv NUnit.2.6.2         /nunit \
  && mv NUnit.Runners.2.6.1 /nunit

COPY red_amber_green.rb /usr/local/bin
