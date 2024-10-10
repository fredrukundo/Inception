FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Expose the default MariaDB port
EXPOSE 3306

# Copy the MariaDB configuration file and custom script
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /script.sh

# Make sure the script is executable
RUN chmod +x /script.sh

# Run the script.sh, which starts MariaDB, sets up the database, then properly starts mysqld
CMD ["/script.sh"]

