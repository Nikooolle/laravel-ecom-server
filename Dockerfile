FROM richarvey/nginx-php-fpm:latest

COPY . .

# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ENV APP_KEY base64:rwcuql2CSQ3LhPZNdTePWTJRmQj9QL6I0kmpTpdNGxU=
ENV APP_ENV production
ENV APP_DEBUG true

ENV DB_CONNECTION mysql
ENV DB_HOST monorail.proxy.rlwy.net
ENV DB_PORT 51078
ENV DB_DATABASE railway
ENV DB_USERNAME root
ENV DB_PASSWORD "7rgy@f06@3qd89kcslxlwjqbggky_$83"


# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

CMD ["/start.sh"]
