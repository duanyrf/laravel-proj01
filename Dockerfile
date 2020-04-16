FROM php:7.4.4-fpm-alpine3.10

RUN apk add bash mysql-client vim
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www

RUN rm -rf html
COPY . .
RUN cp .env.example .env
RUN ln -s public html

EXPOSE 9000

ENTRYPOINT [ "php-fpm" ]