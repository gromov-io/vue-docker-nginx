
# install && build && purne
FROM node:lts-alpine as install-target
ENV PATH $PATH:/app/node_modules/.bin
ARG APP_VERSION=$APP_VERSION
ENV APP_VERSION=$APP_VERSION
WORKDIR /app
COPY src ./src
COPY public ./public
COPY babel.config.js package.json package-lock.json ./
RUN npm install
RUN npm run build

# dist
FROM nginx
ARG APP_VERSION=$APP_VERSION
ENV APP_VERSION=$APP_VERSION
ENV NODE_ENV=production

COPY nginx.conf /etc/nginx/nginx.conf
COPY mime.types /etc/nginx/mime.types

WORKDIR /var/www
COPY --from=install-target /app/dist app