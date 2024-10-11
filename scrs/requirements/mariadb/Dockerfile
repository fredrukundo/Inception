FROM debian:bullseye

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Expose the default MariaDB port

# Copy the MariaDB configuration file and custom script
COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /script.sh

# Make sure the script is executable
RUN chmod +x /script.sh

# Run the script.sh, which starts MariaDB, sets up the database, then properly starts mysqld
CMD ["/script.sh"]

