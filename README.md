# how to setup

    bundle install --path vendor/bundler

# how to provision nodes

    # CHANGE MASTERコマンドでレプリケーションを構築する場合はこれ
    bundle exec itamae ssh -h master0 --vagrant --node-json nodes/master0.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/master.rb && \
    bundle exec itamae ssh -h master1 --vagrant --node-json nodes/master1.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/master.rb && \
    bundle exec itamae ssh -h master2 --vagrant --node-json nodes/master2.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/master.rb && \
    bundle exec itamae ssh -h slave0 --vagrant --node-json nodes/slave0.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/slave.rb && \
    bundle exec itamae ssh -h slave1 --vagrant --node-json nodes/slave1.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/slave.rb && \
    bundle exec itamae ssh -h slave2 --vagrant --node-json nodes/slave2.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/slave.rb

    # Fabricでレプリケーションを構築する場合はこれ
    bundle exec itamae ssh -h master0 --vagrant --node-json nodes/master0.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h master1 --vagrant --node-json nodes/master1.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h master2 --vagrant --node-json nodes/master2.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h slave0 --vagrant --node-json nodes/slave0.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h slave1 --vagrant --node-json nodes/slave1.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h slave2 --vagrant --node-json nodes/slave2.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb

# how to provision Fabric

    bundle exec itamae ssh -h fabric --vagrant --node-json nodes/fabric.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql_fabric/default.rb

# how to provision Router

    bundle exec itamae ssh -h router --vagrant --node-json nodes/router.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql_router/default.rb
