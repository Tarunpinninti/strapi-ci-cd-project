FROM node:18-alpine
WORKDIR /app

COPY ./strapi-task1/package*.json ./
RUN npm install

COPY ./strapi-task1 .

RUN npm run build

EXPOSE 1337
CMD ["npm", "start"]
