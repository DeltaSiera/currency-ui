#### STAGE 1: Build ###
#FROM node:12.7-alpine AS build
#WORKDIR /app
#COPY package.json ./
#RUN npm install
#COPY . .
#RUN npm run build
#
##### STAGE 2: Run ###
#FROM nginx:1.17.1-alpine
##COPY default.conf /etc/nginx/conf.d/default.conf
#EXPOSE 80
#COPY --from=build /app/dist/currency-ui /usr/share/nginx/html
# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
