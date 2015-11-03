# Setup Itamae

    bundle install --path vendor/bundler

# Provisioning

    bundle exec itamae ssh -h master0 --vagrant --node-json nodes/master0.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h master1 --vagrant --node-json nodes/master1.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h master2 --vagrant --node-json nodes/master2.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h slave0 --vagrant --node-json nodes/slave0.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h slave1 --vagrant --node-json nodes/slave1.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h slave2 --vagrant --node-json nodes/slave2.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb ./cookbooks/mysql_replication/fabric.rb && \
    bundle exec itamae ssh -h fabric --vagrant --node-json nodes/fabric.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql_fabric/default.rb && \
    bundle exec itamae ssh -h router --vagrant --node-json nodes/router.json ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql_router/default.rb

# Configure shard

#### Login to Fabric server and these commands

    $ sudo mysqlfabric manage start --daemonize
    $ mysqlfabric sharding add_table 1 test.table0 id
    $ mysqlfabric sharding lookup_table test.table0
    $ mysqlfabric sharding add_shard 1 group0/1,group1/10 --state=ENABLED
    $ mysqlfabric dump sharding_information

# Create test data

#### Connect to Router and these commands

    $ mysql -h 127.0.0.1 -P 7003 -u fabric -p

    mysql> CREATE DATABASE test;
    mysql> CREATE TABLE test.table0 (id INT AUTO_INCREMENT, name VARCHAR(32), PRIMARY KEY (id));
    mysql> INSERT INTO test.table0 (id, name) VALUES (1, 'a'), (2, 'a'), (3, 'a'), (4, 'a'), (5, 'a'), (6, 'a'), (7, 'a'), (8, 'a'), (9, 'a'), (10, 'a'), (11, 'a');
