#
# Cookbook Name:: laravel_nginx
# Provider:: site
#

action :create do
  template "#{node['nginx']['dir']}/laravel.conf" do
    source   'laravel-common.erb'
    owner    'root'
    group    'root'
    mode     00644
    cookbook 'laravel_nginx'
  end

  template "#{node['nginx']['dir']}/sites-available/#{new_resource.name}" do
    source   'laravel-sites.erb'
    owner    'root'
    group    'root'
    mode     00644
    cookbook 'laravel_nginx'
    variables(
      :name => new_resource.name,
      :host => new_resource.host,
      :root => new_resource.root,
      :code => new_resource.code,
      :ssl_certificate => new_resource.ssl_certificate,
      :ssl_certificate_key => new_resource.ssl_certificate_key
    )
  end

  nginx_site new_resource.name do
    enable true
  end

  new_resource.updated_by_last_action(true)
end

