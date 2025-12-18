FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production

# System deps for native modules
RUN apk add --no-cache python3 make g++ libc6-compat

# Copy only package files first (cache friendly)
COPY package*.json ./

# Install deps INSIDE container (important)
RUN npm install --omit=dev

# Copy rest of the app
COPY . .

# Build Strapi admin
RUN node node_modules/@strapi/strapi/bin/strapi.js build

EXPOSE 1337

CMD ["node", "node_modules/@strapi/strapi/bin/strapi.js", "start"]
