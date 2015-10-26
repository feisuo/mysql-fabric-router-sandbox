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
