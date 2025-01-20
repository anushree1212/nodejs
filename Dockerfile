# Use a smaller base image
FROM node:14-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy only the necessary files for dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

EXPOSE 5000

CMD ["node", "app.js"]
