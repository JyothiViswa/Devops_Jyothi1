# Use the pre-built webapp container as the base
FROM hshar/webapp

# Copy your application source code into the required directory
COPY . /var/www/html/
RUN npm install

# Expose port 80 for web traffic
EXPOSE 80
