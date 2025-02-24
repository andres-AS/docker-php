# Usa una imagen de PHP con Apache
FROM php:8.1-apache

# Instala extensiones de PHP necesarias para tu proyecto
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql zip

# Habilita mod_rewrite para Apache
RUN a2enmod rewrite

# Configura el DocumentRoot (ajústalo si tu proyecto tiene un subdirectorio)
WORKDIR /var/www/html

# Expone el puerto 80
EXPOSE 80
