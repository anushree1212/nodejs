# Use official Node.js image from Docker Hub
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
