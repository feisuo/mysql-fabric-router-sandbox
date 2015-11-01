# -*- coding: utf-8 -*-

execute 'install mysql repo' do
  command 'yum install -y http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm'
  not_if "ls /etc/yum.repos.d/mysql-community.repo"
end

%w{
  yum-utils
}.each do |package_name|
  package package_name do
    action :install
  end
end

execute 'disable mysql57' do
  command 'yum-config-manager --disable mysql57-community'
end

execute 'enable mysql56' do
  command 'yum-config-manager --enable mysql56-community'
end

%w{
  mysql-router
}.each do |package_name|
  package package_name do
    action :install
  end
end

template "/etc/mysqlrouter/mysqlrouter.ini" do
  mode   "644"
  notifies :restart, "service[mysqlrouter]"
end

service 'mysqlrouter' do
  action [ :enable, :start ]
end
