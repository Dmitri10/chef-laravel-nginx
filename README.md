# Laravel-nginx Chef Cookbook

Chef cookbook that provides a LWRP for Laravel Nginx sites with PHP-FPM. Provides a base Nginx config for common Laravel settings at `/etc/nginx/laravel.conf`.

Based on [wordpress-nginx](https://github.com/roots/wordpress-nginx) by Scott Walkinshaw

## Requirements

* [nginx](http://community.opscode.com/cookbooks/nginx)
* [php-fpm](http://community.opscode.com/cookbooks/php-fpm)

## Attributes

* `node['laravel_nginx']['fastcgi_read_timeout']` - Timeout for reading a response from the FastCGI server (default=`3600s`)
* `node['laravel_nginx']['static_file_expiry']` - Expiry time for static assets `js|css|png|jpg|jpeg|gif|ico` (default=`24h`)
* `node['laravel_nginx']['php_fpm']['listen']` - Listen socket for PHP-FPM (default=`/var/run/php-fpm-www.sock`)

## Usage

Basic usage with only host and document root:

```ruby
laravel_nginx_site 'example.com' do
  host 'example.com'
  root '/srv/www/example.com'
end
```

This resource would create an Nginx site at `/etc/nginx/sites-available/example.com` and enable it.

If you need to add additional custom config options, you can use the `code` attribute:

```ruby
laravel_nginx_site 'example.com' do
  host 'example.com'
  root '/srv/www/example.com'
  code "include #{node['nginx']['dir']}/custom.conf;"
  notifies :reload, 'service[nginx]'
end
```

## License and Authors

See [LICENSE](LICENSE.md)
