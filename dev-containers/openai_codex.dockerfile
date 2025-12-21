FROM node:lts-bookworm

RUN npm install -g @openai/codex @zed-industries/codex-acp

CMD [ "codex-acp" ]
