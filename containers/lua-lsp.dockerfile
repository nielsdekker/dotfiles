FROM fedora:44

RUN dnf install -y gopls

CMD ["gopls"]
