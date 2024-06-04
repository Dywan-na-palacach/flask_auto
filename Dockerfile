FROM python:3.9
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

COPY package.json .
COPY yarn.lock .
COPY index.js .

FROM --platform=$BUILDPLATFORM python:alpine AS base
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

ENV FLASK_APP=app.py


FROM app-base AS test
RUN yarn install
RUN yarn test

EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
