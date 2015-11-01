# how to setup

    bundle install --path vendor/bundler

# how to provision

    bundle exec itamae ssh -h default --vagrant ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb

    bundle exec itamae ssh -h master0 --vagrant --node-json nodes/master0.json ./cookbooks/mysql_replication/master.rb
    bundle exec itamae ssh -h slave0 --vagrant --node-json nodes/slave0.json ./cookbooks/mysql_replication/slave.rb
    bundle exec itamae ssh -h slave1 --vagrant --node-json nodes/slave1.json ./cookbooks/mysql_replication/slave.rb
