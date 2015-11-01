# -*- coding: utf-8 -*-

template "/etc/my.cnf" do
  mode   "644"
  notifies :restart, "service[mysqld]", :immediately
end

execute 'create replication user' do
  command "
mysql -u root mysql <<EOF
CREATE USER 'repl'@'%' IDENTIFIED BY 'repl';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
EOF
"
  not_if "mysql -u root -e 'SELECT host, user FROM mysql.user' | grep repl"
end
