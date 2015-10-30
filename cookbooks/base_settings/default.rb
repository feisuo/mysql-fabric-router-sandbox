# -*- coding: utf-8 -*-

%w{
  ntp
  sysstat
  dstat
  zsh
  tree
  git
  curl
  vim
}.each do |package_name|
  package package_name do
    action :install
  end
end

execute 'disable iptables' do
  command '
service iptables stop
service ip6tables stop
chkconfig iptables off
chkconfig ip6tables off
'
end
