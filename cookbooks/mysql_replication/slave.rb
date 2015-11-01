# -*- coding: utf-8 -*-

template "/etc/my.cnf" do
  mode   "644"
end

service 'mysqld' do
  action [ :restart ]
end

execute 'start slave' do
  command "
mysql -u root mysql <<EOF
CHANGE MASTER TO MASTER_HOST='#{node[:master_node]}', MASTER_PORT=3306, MASTER_USER='repl', MASTER_PASSWORD='repl', MASTER_AUTO_POSITION=1;
START SLAVE;
EOF
"
  not_if "mysql -u root -e 'SELECT host, user FROM mysql.user' | grep repl"
end
