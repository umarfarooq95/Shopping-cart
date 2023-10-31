# Stage 1
FROM node:16-alpine as node
WORKDIR /app
COPY package*.json ./
RUN npm install --force
COPY . .
RUN npm run build


# Stage 2
FROM nginx:alpine
COPY --from=node /app/dist /usr/share/nginx/html