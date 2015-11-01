# -*- coding: utf-8 -*-

template "/etc/my.cnf" do
  mode   "644"
end

service 'mysqld' do
  action [ :restart ]
end

execute 'create user' do
  command "
mysql -u root mysql <<EOF
CREATE USER 'repl'@'%' IDENTIFIED BY 'repl';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
EOF
"
  not_if "mysql -u root -e 'SELECT host, user FROM mysql.user' | grep repl"
end
