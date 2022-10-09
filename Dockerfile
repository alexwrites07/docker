# Stage 1: Anwendung bauen
FROM node:16 as buildcontainer
WORKDIR /usr/src/app
COPY . ./
RUN npm install
RUN npm run build

# Stage 2: Webserver starten
FROM nginx
LABEL maintainer="Ihr Name <you@your.domain>"
COPY nginx/default.conf /etc/nginx/conf.d
COPY --from=buildcontainer /usr/src/app/dist/book-monkey /usr/share/nginx/html
