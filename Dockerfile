FROM node:14

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy application code
COPY . .

# Expose port 5000
EXPOSE 5000

# Start the application
CMD ["node", "app.js"]
