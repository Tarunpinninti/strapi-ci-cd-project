FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production
ENV NODE_OPTIONS="--max-old-space-size=2048"

RUN apk add --no-cache python3 make g++

COPY package*.json ./
RUN npm install

COPY . .

# FIX: run Strapi build via node (no permission issue)
RUN node node_modules/@strapi/strapi/bin/strapi.js build

EXPOSE 1337

CMD ["node", "node_modules/@strapi/strapi/bin/strapi.js", "start"]


