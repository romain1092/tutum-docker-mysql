FROM ubuntu:saucy
MAINTAINER Fernando Mayo <fernando@tutum.co>

# Install packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server pwgen

# Add image configuration and scripts
ADD start.sh /start.sh
ADD run.sh /run.sh
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD import_sql.sh /import_sql.sh
RUN chmod 755 /*.sh

EXPOSE 3306
CMD ["/run.sh"]
