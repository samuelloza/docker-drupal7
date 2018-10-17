FROM php:7.0-fpm
MAINTAINER Samuel Loza <samuel.loza@qkiez.com>

RUN apt-get update && apt-get install -y locales
RUN echo America\La_Paz > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update
RUN apt-get install -y curl libc-client-dev zip zlib1g-dev libssl-dev libcurl4-openssl-dev pkg-config
RUN apt install -y librecode0
RUN apt install -y librecode-dev
RUN apt install -y libtidy-dev
RUN apt install -y libldb-dev libldap2-dev
RUN apt install -y libmcrypt-dev
RUN apt install -y libicu-dev
RUN apt install -y libxml2-dev
Run apt install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev
Run apt install -y mariadb-client
RUN docker-php-ext-install zip
RUN docker-php-ext-install curl
RUN docker-php-ext-install recode
RUN docker-php-ext-install tidy
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ 
RUN docker-php-ext-install ldap
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install intl
RUN docker-php-ext-install xml
RUN docker-php-ext-install soap
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pdo 
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install json 
RUN docker-php-ext-install fileinfo 
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install gd

RUN rm -r /var/lib/apt/lists/*
COPY conf/php.ini /etc/php/7.0/fpm/php.ini