docker-php53
############

PHP 5.3 docker image build files (Centos 6 based)

What
====

php-fpm 5.3 docker image for running legacy apps on modern systems.

Includes support for:

* apc 
* gd 
* mbstring
* memcache
* mysql
* xml

Usage
=====

Building and image
------------------

.. code-block:: bash

    make

Running a container
-------------------

.. code-block:: bash

    docker run -d -p 9000:9000 -v /var/log/php-fpm-container:/var/log/php-fpm -v /srv/webapp:/srv/webapp --name container2 -t leucos/phpfpm-53:latest

Fiddling with the running container
-----------------------------------

.. code-block:: bash

    docker exec -it $(docker ps -q) /bin/bash

