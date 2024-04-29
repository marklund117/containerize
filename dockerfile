FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install ALL app dependencies
COPY package*.json .
RUN npm install @sveltejs/adapter-node
RUN npm ci

# Bundle app source
COPY . .

# Build the app
RUN npm run build

# Expose the port
EXPOSE 4173

# Run the app
CMD ["npm", "run", "preview", "--host"]













