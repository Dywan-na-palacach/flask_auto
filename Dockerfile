FROM node:8.6.0
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

COPY package.json .
COPY yarn.lock .
COPY index.js .

FROM --platform=$BUILDPLATFORM python:alpine AS base
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

FROM app-base AS test
RUN yarn install
RUN yarn test

EXPOSE 8000
CMD node index.js
