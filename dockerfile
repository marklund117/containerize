FROM node:lts-alpine

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

RUN npm install && npm install --production

RUN npm install vite @sveltejs/kit @sveltejs/adapter-node

EXPOSE 5173

RUN chown -R node /usr/src/app
USER node

CMD ["npm", "run", "preview"]


