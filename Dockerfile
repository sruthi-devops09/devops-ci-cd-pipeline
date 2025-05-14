FROM node:18-alpine
WORKDIR /app
COPY app/package*.json ./
RUN npm ci
COPY app/ ./
EXPOSE 3000
CMD ["npm", "start"]
