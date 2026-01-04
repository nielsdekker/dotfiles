from node:lts-bookworm

RUN npm install -g opencode-ai

CMD [ "opencode", "acp" ]
