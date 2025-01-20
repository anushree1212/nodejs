# Use an official Node.js image as the base image
FROM node:14

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to leverage Docker caching
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application code
COPY . .

# Expose port 5000 for the application
EXPOSE 5000

# Start the application
CMD ["node", "app.js"]
