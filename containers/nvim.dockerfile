FROM alpine:latest

# Gebruik dezelfde home folder als waarmee we de container bouwen
ARG HOME
ARG UID

ENV HOME=${HOME}

# Installeer tools
RUN apk add \
    bash \
    curl \
    fzf \
    git \
    go \
    gopls \
    lua-language-server \
    neovim \
    nodejs \
    npm \
    openssh \
    prettier \
    python3 \
    ripgrep \
    tree-sitter \
    tree-sitter-cli

# En installeer alle het losse spul
RUN npm install -g @typescript/native-preview

# Voeg spellfiles toe
RUN curl -fLo /usr/share/nvim/runtime/spell/nl.utf-8.spl \
    https://ftp.nluug.nl/vim/runtime/spell/nl.utf-8.spl
RUN curl -fLo /usr/share/nvim/runtime/spell/nl.utf-8.sug \
    https://ftp.nluug.nl/vim/runtime/spell/nl.utf-8.sug
RUN curl -fLo /usr/share/nvim/runtime/spell/en.utf-8.spl \
    https://ftp.nluug.nl/vim/runtime/spell/en.utf-8.spl
RUN curl -fLo /usr/share/nvim/runtime/spell/en.utf-8.sug \
    https://ftp.nluug.nl/vim/runtime/spell/en.utf-8.sug

# Kopieer de dotfiles
COPY nvim/ ${HOME}/.config/nvim

# Installeer de plugins en treesitter parsers
RUN nvim --headless --cmd 'lua vim.pack.update()' +qa
RUN nvim --headless +'lua require("nvim-treesitter").install({ "bash", "dtd", "go", "javascript", "json", "jsx", "python", "sql", "typescript", "xml" })' +qa

# Fix home permissies
RUN chown -R ${UID}:${UID} ${HOME}

