FROM node:16.15.1 as build
WORKDIR /lit-clothing
COPY package.json /lit-clothing
RUN npm install
COPY . /lit-clothing

RUN npm run build
FROM nginx:1.19
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /lit-clothing/build /usr/share/nginx/html
