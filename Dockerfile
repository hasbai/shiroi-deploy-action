FROM node:20-alpine AS base

WORKDIR /app

RUN npm install -g --arch=x64 --platform=linux sharp

COPY public .
COPY .next/standalone ./
COPY .next/static .next/static

ENV NODE_ENV=production
ENV HOSTNAME=0.0.0.0
ENV PORT=2323

EXPOSE 2323
ENTRYPOINT ["node", "server.js"]
