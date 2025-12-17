
FROM node:20-alpine

WORKDIR /app

# Required for native modules like better-sqlite3
RUN apk add --no-cache python3 make g++

# Copy only package files first (for better caching)
COPY package.json package-lock.json* ./

# Install dependencies INSIDE container
RUN npm install

# Copy rest of the application
COPY . .

# Build Strapi admin panel
RUN node node_modules/@strapi/strapi/bin/strapi.js build

EXPOSE 1337

# Start Strapi
CMD ["node", "node_modules/@strapi/strapi/bin/strapi.js", "start"]
