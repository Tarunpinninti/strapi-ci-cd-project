FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production
ENV NODE_OPTIONS="--max-old-space-size=2048"

# Required for native modules (better-sqlite3)
RUN apk add --no-cache python3 make g++

# Copy only package files first
COPY package*.json ./

# Install dependencies INSIDE container (Linux build)
RUN npm install --production

# Copy application code (without node_modules)
COPY . .

# Build Strapi admin
RUN node node_modules/@strapi/strapi/bin/strapi.js build

EXPOSE 1337

CMD ["node", "node_modules/@strapi/strapi/bin/strapi.js", "start"]
