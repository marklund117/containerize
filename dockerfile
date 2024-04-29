FROM node:lts-alpine

ENV NODE_ENV=production
ENV HOST=0.0.0.0

WORKDIR /usr/src/app

COPY package*.json .

RUN npm install

COPY . .

RUN npm install --production
RUN npm install vite @sveltejs/adapter-node

EXPOSE 5173

RUN chown -R node /usr/src/app
USER node

CMD ["npm", "run", "start", "--", "--host=0.0.0.0"]





