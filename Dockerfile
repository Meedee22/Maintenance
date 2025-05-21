# Use official Node.js image as base
FROM node:18-alpine

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package.json .
RUN npm install

# Copy all app files
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
