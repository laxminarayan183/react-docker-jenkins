# Use an official Node.js runtime as the base image
FROM node:18-alpine

# Set working directory
WORKDIR /myapp

# Copy package.json and package-lock.json first to install dependencies
COPY package*.json .

# Install dependencies
RUN npm install

# Copy the rest of the app’s source code
COPY . .

EXPOSE 5173

CMD [ "npm","run","dev" ]



