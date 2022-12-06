FROM node:16.15.1 as build
WORKDIR /lit-clothing

COPY package*.json .
RUN npm install
COPY . .

