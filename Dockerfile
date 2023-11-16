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

# ENV DB_CONNECTION pgsql
# ENV DB_HOST dpg-clb3skunt67s73f8ll5g-a
# ENV DB_PORT 5432
# ENV DB_DATABASE ecom_server
# ENV DB_USERNAME root
# ENV DB_PASSWORD 2NpFHxqNJBL4YmEeP8K0qEFT8r1Tfyh8

ENV DB_CONNECTION mysql
ENV DB_HOST aws.connect.psdb.cloud
ENV DB_PORT 3306
ENV DB_DATABASE ecom-server
ENV DB_USERNAME piff8y6s0x8thppa0qe0
ENV DB_PASSWORD pscale_pw_T51LV1MgxgQDF5gXE1aNrB0Nl6Lnrk41zAmZbT7jZZm
# ENV MYSQL_ATTR_SSL_CA /var/www/html/public/socmed-server/cacert-2023-08-22.pem
ENV MYSQL_ATTR_SSL_CA /ect/secrets/cacert-2023-08-22.pem

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

CMD ["/start.sh"]
