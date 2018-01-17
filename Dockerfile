FROM node:8.9.4

RUN yarn global add @angular/cli

ENV HOME=/home/node

COPY package*.json $HOME/
RUN chown -R node:node $HOME/*

USER node
WORKDIR $HOME/
RUN yarn install

USER root
COPY . $HOME/
RUN chown -R node:node $HOME/*
USER node

WORKDIR $HOME