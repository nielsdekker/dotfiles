# Een collectie CLI tools die voor development gebruikt kunnen worden. Dit zijn
# voornamelijk LSP's en formatters.
FROM localhost/alpine-base:latest

# Installeer tools
RUN apk add \
    nodejs \
    go \
    npm

# Voeg LSP's/formatters toe die een package hebben
RUN apk add \
    tree-sitter \
    lua-language-server \
    prettier \
    gopls

# En installeer alle het losse spul
RUN npm install -g @typescript/native-preview
