FROM mcr.microsoft.com/dotnet/core/sdk:3.1.301-alpine3.12

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# START of extra commands to fulfil runner's requirements (os=Alpine)
RUN (getent group sandbox) || (addgroup -g 51966 sandbox)
RUN (grep -q sandbox:x:41966 /etc/passwd) || (adduser -D -g "" -h /home/sandbox -G sandbox -s /bin/bash -u 41966 sandbox)
RUN apk add --update coreutils bash tar file
ARG GIT_COMMIT_SHA
ENV SHA=${GIT_COMMIT_SHA}
# END of extra commands to fulfil runner's requirements
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

COPY common-packages.csproj .

RUN mkdir /packages

RUN dotnet restore common-packages.csproj --packages /packages

COPY red_amber_green.rb /usr/local/bin
