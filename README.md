# wordpress-nginx Chef Cookbook

Chef cookbook that configures Nginx for a WordPress site with PHP-FPM. Provides a base Nginx config for common WordPress settings at `/etc/nginx/wordpress.conf`.

Any sites specified through the attribute below will be added to `/etc/nginx/sites-available/wordpress` and include `wordpress.conf`. The `wordpress` site will be enabled as well.

## Requirements

* [nginx](http://community.opscode.com/cookbooks/nginx)
* [php-fpm](http://community.opscode.com/cookbooks/php-fpm)

## Attributes

* `node['wordpress_nginx']['fastcgi_read_timeout']` -  Timeout for reading a response from the FastCGI server (default=`3600s`)
* `node['wordpress_nginx']['static_file_expiry']` - Expiry time for static assets `js|css|png|jpg|jpeg|gif|ico` (default=`24h`)
* `node['wordpress_nginx']['sites']` - nginx sites to enable. Example:

```ruby
node['wordpress_nginx']['sites'] = {
  'default' => {
    'hosts' => 'localhost',
    'root'  => '/srv/www/default'
  }
}
```

## Usage

### wordpress-nginx::default

Just include `wordpress-nginx` in your node's `run_list`:

```json
{
  "name": "my_node",
  "run_list": [
    "recipe[wordpress-nginx]"
  ]
}
```

## Contributing

1. Fork the repository
2. Create a named feature branch (like `add_component_x`)
3. Commit your changes
4. Submit a pull request

## License and Authors

See [LICENSE](LICENSE.md)
