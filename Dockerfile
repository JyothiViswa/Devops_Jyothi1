# Use the pre-built webapp container as the base
FROM hshar/webapp

# Copy your application source code into the required directory
COPY . /var/www/html/

# Expose port 80 for web traffic
EXPOSE 80


# If the container tries to run npm by default, override it to start Apache in the foreground:
CMD ["apachectl", "-D", "FOREGROUND"]
