# -*- coding: utf-8 -*-

template "/etc/my.cnf"

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
end
