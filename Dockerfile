## Use the official Node.js image as the base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Debug step: List files in /app to ensure package.json is present
RUN ls -l /app

# Build the React application
RUN npm run build

# Install serve to serve the build files
RUN npm install -g serve

# Serve the application
CMD ["serve", "-s", "build"]

# Expose port 3000
EXPOSE 3000

