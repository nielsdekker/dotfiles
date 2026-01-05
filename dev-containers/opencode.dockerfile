from node:lts-bookworm

ARG VERSION_OPENCODE=v1.1.3
ARG VERSION_KOTLIN_LSP=261.13587.0
ARG VERSION_JAVA=21

# Install tools
RUN apt update; \
    apt -y upgrade; \
    apt install -y git ripgrep apt-transport-https gpg;

# Install java
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public \
    | gpg --dearmor \
    | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null;
RUN echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list;
RUN apt update && apt install -y temurin-${VERSION_JAVA}-jdk;

# Setup the kotlin lsp
WORKDIR /tmp/kotlin_lsp
RUN wget -q https://download-cdn.jetbrains.com/kotlin-lsp/${VERSION_KOTLIN_LSP}/kotlin-lsp-${VERSION_KOTLIN_LSP}-linux-x64.zip; \
    unzip kotlin-lsp-${VERSION_KOTLIN_LSP}-linux-x64.zip; \
    rm kotlin-lsp-${VERSION_KOTLIN_LSP}-linux-x64.zip; \
    mv /tmp/kotlin_lsp /opt/kotlin_lsp/; \
    chmod +x /opt/kotlin_lsp/kotlin-lsp.sh;

# Install opencode
RUN npm install -g opencode-ai@${VERSION_OPENCODE}

CMD [ "opencode" ]
