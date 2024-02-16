# Production Dockerfile
FROM node:18 AS production

WORKDIR /app

# Install dependencies
COPY package*.json ./
COPY tsconfig*.json ./
COPY angular.json ./
COPY ngsw-config.json ./
COPY LICENSE ./
COPY .env ./

# Copy the application code
COPY src ./src
COPY utils ./utils

# Set the user to use when running this image
USER root
RUN chown -R node:node /app
RUN chmod +x ./utils/brotli-compress.js
RUN npm i -g @angular/cli
RUN npm install -g http-server

USER node

RUN npm ci
RUN npm run build -- --configuration=production
RUN node ./utils/brotli-compress.js
RUN npm prune --production

CMD ["http-server", "-p", "4200", "--brotli", "--index", "index.html", "--log-ip", "--ssl", "--cert", "./.conf/certificates/ssl/comport_key.pem", "--key", "./.conf/certificates/ssl/comport_key.pem", "./dist/comport"]
