FROM node:lts-alpine

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

RUN npm run build

EXPOSE 5173

RUN chown -R node /usr/src/app
USER node

CMD ["npm", "run", "start", "--", "--host=0.0.0.0"]








