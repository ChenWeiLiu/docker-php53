FROM centos:6
RUN yum -y update && yum clean all
RUN yum -y install php-fpm php-gd php-mbstring php-mysql php-pecl-apc php-pecl-memcache php-process php-xml && yum clean all
COPY www.conf /etc/php-fpm.d/www.conf
COPY php.ini /etc/php.ini
RUN mkdir -p /var/www/html
EXPOSE 9000
ENTRYPOINT /usr/sbin/php-fpm --nodaemonize
