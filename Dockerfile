FROM ubuntu:precise

MAINTAINER Michel blanc <mb@mbnet.fr>

RUN apt-get update
RUN apt-get -y install php-pear php5-cgi php5-cli php5-common php5-curl php5-fpm php5-gd php5-memcached php5-imagick php5-intl php5-mcrypt php5-mysql php5-tidy php5-xsl

COPY www.conf /etc/php5/fpm/pool.d/www.conf
COPY php.ini /etc/php5/fpm/php.ini
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf

RUN mkdir -p /var/www/html
EXPOSE 9000
CMD ["/usr/sbin/php5-fpm"]
