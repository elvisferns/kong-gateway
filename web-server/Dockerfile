FROM node:14-alpine

LABEL "logspout.exclude"=true

WORKDIR /app

COPY ./package.json ./package.json

COPY ./package-lock.json ./package-lock.json

RUN npm i --production

COPY ./server.js ./server.js

EXPOSE 8080

CMD [ "npm", "start" ]