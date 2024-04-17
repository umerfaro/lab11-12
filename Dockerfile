FROM node:16-alpine as build

WORKDIR /app

COPY package*.json ./

# Clear npm cache and install with verbose logging
RUN npm cache clean --force && npm install --verbose

COPY . .

CMD ["npm", "run", "build"]
