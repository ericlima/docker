FROM node:alpine as builder
WORKDIR '/app'
ADD package.json .
RUN npm install
ADD . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
