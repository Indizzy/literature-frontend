FROM node:16-alpine
WORKDIR /usr/app
COPY . .
RUN yarn install
EXPOSE 3000
CMD ["yarn", "start"]
