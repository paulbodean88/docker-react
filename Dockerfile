FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
run npm run build
COPY --chown=node:node . ./
COPY --from=builder /app/build /usr/share/nginx/html
