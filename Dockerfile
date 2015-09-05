FROM ubuntu:precise

MAINTAINER Michel blanc <mb@mbnet.fr>

RUN apt-get update
RUN apt-get -y install php-pear php5-cgi php5-cli php5-common php5-curl php5-fpm php5-gd php5-memcached php5-imagick php5-intl php5-mcrypt php5-mysql php5-tidy php5-xsl

COPY www.conf /etc/php-fpm.d/www.conf
COPY php.ini /etc/php.ini
RUN echo "extension=memcached.so" > /etc/php.d/memcached.ini
RUN mkdir -p /var/www/html
EXPOSE 9000
ENTRYPOINT /usr/sbin/php-fpm --nodaemonize
