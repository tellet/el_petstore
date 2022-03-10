FROM node:10.11.0-alpine

RUN npm install -g newman newman-reporter-html express fs body-parser

WORKDIR /etc/newman

COPY collections ./collections
COPY environments ./environments

ENTRYPOINT ["newman"]