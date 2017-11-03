FROM node:8.9.0
ENV TERM=xterm
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /src
WORKDIR /src
ADD ./src/package.json /src/package.json
ADD ./src/yarn.lock /src/yarn.lock
ADD ./src/package-lock.json /src/package-lock.json
ENV PATH="/src/node_modules/.bin:$PATH"
RUN yarn global add create-react-app
RUN yarn install
