FROM node:18-alpine as builder
WORKDIR /myapp
COPY package*.json .
RUN npm install
EXPOSE 3000
COPY . .

FROM node:18-alpine as production
WORKDIR /myapp
USER node
COPY --from=builder --chown=node:node /myapp .
CMD ["npm" , "start"]
