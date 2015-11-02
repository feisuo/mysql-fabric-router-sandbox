# -*- coding: utf-8 -*-

template "/etc/my.cnf" do
  mode   "644"
  notifies :restart, "service[mysqld]", :immediately
end

execute 'create fabric user' do
  command "
mysql -u root mysql <<EOF
CREATE USER 'fabric'@'%' IDENTIFIED BY 'fabric';
GRANT ALL ON *.* TO 'fabric'@'%';
EOF
"
  not_if "mysql -u root -e 'SELECT host, user FROM mysql.user' | grep fabric"
end
