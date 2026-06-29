# Base image die alpine linux opzet met de juiste dependencies om binnen toolbox
# te draaien
FROM alpine:latest

ENV TERM=xterm-256color

RUN apk update && apk upgrade

RUN apk add \
    alpine-base \
	fzf \
    zsh \
	libcap \
    shadow \
    bash \
    bash-completion \
    gcompat
