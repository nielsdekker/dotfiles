FROM alpine:latest

# Regripper
RUN apk add perl perl-app-cpanminus make
RUN wget 'https://github.com/keydet89/RegRipper4.0/archive/refs/heads/master.zip' -O /tmp/regripper.zip
RUN unzip /tmp/regripper.zip -d /opt/
RUN cpanm Parse::Win32Registry
RUN echo '#!/bin/sh' > /usr/bin/rip
RUN echo 'perl /opt/RegRipper4.0-main/rip.pl "$@"' >> /usr/bin/rip
RUN chmod +x /usr/bin/rip
