# Use the official Node.js image.
FROM node:14

# Set the working directory.
WORKDIR /app

# Copy package.json and package-lock.json (if present).
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of the application code.
COPY . .

# Build the React application.
RUN npm run build

# Expose port 3000.
EXPOSE 3000

# Start the application.
CMD ["npm", "start"]
