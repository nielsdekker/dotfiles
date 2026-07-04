FROM alpine:latest

# EvtxECmd
RUN apk add dotnet9-runtime
RUN wget 'https://download.ericzimmermanstools.com/net9/EvtxECmd.zip' -O /tmp/EvtxeCmd.zip
RUN unzip /tmp/EvtxeCmd.zip -d /opt/ && rm /tmp/EvtxeCmd.zip
RUN echo '#!/bin/sh' > /usr/bin/evtxecmd
RUN echo 'dotnet /opt/EvtxeCmd/EvtxECmd.dll "$@"' >> /usr/bin/evtxecmd
RUN chmod +x /usr/bin/evtxecmd
RUN evtxecmd --sync
