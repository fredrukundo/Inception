#!/bin/bash

# Start the MySQL service
service mariadb start
sleep 5
# Create the database if it doesn't already exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create the user if they don't exist and assign a password
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant privileges to the user for the created database
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%'IDENTIFIED BY '${SQL_PASSWORD}';"

# Set the root user password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Flush privileges to ensure changes take effect
mysql -e "FLUSH PRIVILEGES;"

# Stop the MySQL service
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

# Start MySQL in safe mode
exec mysqld_safe
