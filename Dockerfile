FROM ubuntu:precise

MAINTAINER Michel blanc <mb@mbnet.fr>

RUN apt-get update && apt-get upgrade
RUN apt-get -y install php-pear php5-cgi php5-cli php5-common php5-curl php5-fpm php5-gd php5-imagick php5-intl php5-mcrypt php5-mysql php5-tidy php5-xsl php-apc ssmtp libssh2-php make

RUN echo "" | pecl install memcache-beta

COPY www.conf /etc/php5/fpm/pool.d/www.conf
COPY php.ini /etc/php5/fpm/php.ini
COPY apc.ini /etc/php5/fpm/conf.d/apc.ini
COPY memcache.ini /etc/php5/fpm/conf.d/memcache.ini
COPY ssh2.ini /etc/php5/fpm/conf.d/ssh2.ini
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf
RUN mkdir -p /var/www/html
EXPOSE 9000
CMD ["/usr/sbin/php5-fpm"]
