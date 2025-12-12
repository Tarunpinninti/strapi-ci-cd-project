FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

# Strapi v5 requires Python + build tools for better-sqlite3
RUN apk add --no-cache python3 make g++ 

RUN npm install

COPY . .

RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]


