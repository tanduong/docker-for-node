FROM node:7.4.0
ENV TERM=xterm
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /src
WORKDIR /src
ADD ./src/package.json /src/package.json
ADD ./src/yarn.lock /src/yarn.lock
RUN npm install -g yarn
RUN yarn install
RUN yarn global add bower
RUN yarn global add pm2
RUN bower install --allow-root
