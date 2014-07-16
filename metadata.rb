name             'laravel_nginx'
maintainer_email 'me@codemonkey.io'
license          'MIT'
description      'Installs/Configures Nginx sites for Laravel with PHP-FPM'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.8'

depends          'nginx'
depends          'php-fpm'
