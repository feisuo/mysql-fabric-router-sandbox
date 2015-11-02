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
  mysql-community-server
  mysql-utilities
}.each do |package_name|
  package package_name do
    action :install
  end
end

service 'mysqld' do
  action [ :enable, :start ]
end

# setup fabric
remote_file "/etc/mysql/fabric.cfg" do
  mode   "644"
end

execute 'create fabric user' do
  command "
# backing store
mysql -u root mysql <<EOF
CREATE USER 'fabric'@'localhost' IDENTIFIED BY 'fabric';
GRANT ALL ON *.* TO 'fabric'@'localhost';
EOF

# setup Fabric
mysqlfabric manage setup

# Fabric start
mysqlfabric manage start --daemonize

# create group
mysqlfabric group create group_global
mysqlfabric group create group0
mysqlfabric group create group1

# add server to group
mysqlfabric group add group_global #{node[:group_global_node0]}  # master0
mysqlfabric group add group_global #{node[:group_global_node1]}  # slave0
mysqlfabric group add group0 #{node[:group0_node0]}              # master1
mysqlfabric group add group0 #{node[:group0_node1]}              # slave1
mysqlfabric group add group1 #{node[:group1_node0]}              # master2
mysqlfabric group add group1 #{node[:group1_node1]}              # slave2

# promote
mysqlfabric group promote group_global
mysqlfabric group promote group0
mysqlfabric group promote group1

# confirm group
mysqlfabric group lookup_groups
mysqlfabric group lookup_servers group_global
mysqlfabric group lookup_servers group0
mysqlfabric group lookup_servers group1

# configure shard (shard by RANGE and global group is group_global)
mysqlfabric sharding create_definition RANGE group_global

# confirm sharding
mysqlfabric sharding list_definitions
"
  not_if "mysql -u root -e \"SELECT host, user FROM mysql.user WHERE host = 'localhost' AND user = 'fabric'\" | grep fabric"
end
