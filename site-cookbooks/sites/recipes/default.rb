directory "/var/www" do
  user node.site_owner
  group node.site_owner
end

node.domains.each do |domain, options|

  root = "/var/www/#{domain}"

  [root, "#{root}/public", "#{root}/log"].each do |dir|
    directory dir do
      user node.site_owner
      group node.site_owner
    end
  end

  logrotate_app domain do
    cookbook "logrotate"
    path "#{root}/log/*.log"
    frequency "daily"
    # make sure the new files are still owned by me
    create "644 #{node.site_owner} #{node.site_owner}"
    rotate 90 # keep 90 days of logs
  end

  if options[:type] == :static
    template "#{root}/public/index.html" do
      source "index.html.erb"
      user node.site_owner
      group node.site_owner
      not_if { File.exist? "#{root}/public/index.html" }
      variables({
        domain: domain,
      })
    end
  end

  template "/etc/nginx/conf.d/#{domain}.conf" do
    source "nginx.conf.erb"
    user node.site_owner
    group node.site_owner
    variables({
      domain: domain,
      public: "#{root}/public",
      log: "#{root}/log",
      options: options,
    })
    notifies :reload, "service[nginx]", :delayed
  end

end

