FROM node:lts-alpine

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

RUN npm install --production

COPY . .

RUN npm install vite

EXPOSE 5173

RUN chown -R node /usr/src/app
USER node

CMD ["npx", "vite", "preview", "--host"]

