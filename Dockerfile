FROM centos:6
RUN yum -y update && yum clean all
RUN yum -y install php-fpm php-gd php-mbstring php-mysql php-pecl-apc php-process php-xml tar cyrus-sasl-devel zlib-devel gcc-c++ make php-devel wget && yum clean all 
RUN wget https://launchpad.net/libmemcached/1.0/1.0.16/+download/libmemcached-1.0.16.tar.gz
RUN tar -xvf libmemcached-1.0.16.tar.gz
WORKDIR libmemcached-1.0.16
RUN ./configure --disable-memcached-sasl && make && make install
RUN printf "\n" |  pecl install memcached
COPY www.conf /etc/php-fpm.d/www.conf
COPY php.ini /etc/php.ini
RUN echo "extension=memcached.so" > /etc/php.d/memcached.ini
RUN mkdir -p /var/www/html
EXPOSE 9000
ENTRYPOINT /usr/sbin/php-fpm --nodaemonize
