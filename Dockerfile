FROM cyberdojofoundation/csharp
LABEL maintainer=jon@jaggersoft.com

COPY packages.config .

RUN \
apk add --update openssl && \
wget http://dist.nuget.org/win-x86-commandline/latest/nuget.exe && \
mono --runtime=v4.5 nuget.exe restore -PackagesDirectory . && \
mkdir /nunit && \
mv NUnit.*/lib                  /nunit && \
mv NUnit.ConsoleRunner.*/tools  /nunit

COPY red_amber_green.rb /usr/local/bin
