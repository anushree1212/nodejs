FROM node:14

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Install nodemon globally (optional)
RUN npm install -g nodemon

# Copy application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the app with nodemon
CMD ["npm", "start"]
