FROM alpine:latest

RUN apk add dotnet9-runtime
RUN wget 'https://download.ericzimmermanstools.com/net9/MFTECmd.zip' -O /tmp/MFTECmd.zip
RUN unzip /tmp/MFTECmd.zip -d /opt/MFTECmd && rm /tmp/MFTECmd.zip
RUN echo '#!/bin/sh' > /usr/bin/mftecmd
RUN echo 'dotnet /opt/MFTECmd/MFTECmd.dll "$@"' >> /usr/bin/mftecmd
RUN chmod +x /usr/bin/mftecmd
