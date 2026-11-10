# ==========================================
# Stage 1: Build / Dependencies Stage
# ==========================================
# Use hshar/webapp base image for your tech stack 
FROM hshar/webapp:latest

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy your latest code into the required path
COPY . /var/www/html/

# Update package list and install Node.js and npm
RUN apt-get update && apt-get install -y nodejs npm

# Install project dependencies
RUN npm install
