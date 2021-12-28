FROM node:16 AS build

WORKDIR /ang

COPY package*.json ./
RUN npm ci

COPY . ./

RUN npm run build

FROM nginx:1.20-alpine
COPY --from=build /ang/dist/kubak-landing-page-angular /usr/share/nginx/html
