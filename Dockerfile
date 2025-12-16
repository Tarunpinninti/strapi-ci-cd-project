FROM node:20-alpine

WORKDIR /app

ENV NODE_OPTIONS="--max-old-space-size=2048"

RUN apk add --no-cache python3 make g++

COPY package*.json ./
RUN npm install

COPY . .

# FIX: use npx instead of direct strapi
RUN npx strapi build

EXPOSE 1337

CMD ["npm", "start"]


