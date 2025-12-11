FROM astral-sh/uv:alpine

ENV PATH=/root/.local/bin:$PATH
RUN uv tool install mistral-vibe

WORKDIR /app

CMD [ "vibe" ]
