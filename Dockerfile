
FROM node:20-bullseye

WORKDIR /app

ENV NODE_ENV=production
ENV NODE_OPTIONS="--max-old-space-size=2048"

# Install dependencies required for native modules
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy package files first (better cache)
COPY package*.json ./

# Install dependencies inside container (IMPORTANT)
RUN npm install

# Copy rest of the app
COPY . .

# Build Strapi admin
RUN node node_modules/@strapi/strapi/bin/strapi.js build

EXPOSE 1337

CMD ["node", "node_modules/@strapi/strapi/bin/strapi.js", "start"]
