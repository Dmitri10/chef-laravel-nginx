#
# Cookbook Name:: laravel_nginx
# Resource:: site
#

actions :create

default_action :create

attribute :host, :kind_of => String, :default => 'localhost'
attribute :root, :kind_of => String, :default => nil
attribute :code, :kind_of => String, :default => nil
attribute :ssl_certificate, :kind_of => String, :default => nil
attribute :ssl_certificate_key, :kind_of => String, :default => nil
attribute :cache_images, :kind_of => [TrueClass, FalseClass], :default => true
attribute :is_default, :kind_of => [TrueClass, FalseClass], :default => false
attribute :force_ssl, :kind_of => [TrueClass, FalseClass], :default => true

