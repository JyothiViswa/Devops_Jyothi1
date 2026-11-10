```dockerfile
# Use an official Node.js image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your application code
COPY . .

# Command to run your tests
CMD ["npm", "test"]
```
