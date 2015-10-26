# how to setup

    bundle install --path vendor/bundler
    vagrant plugin install vagrant-itamae

# how to provision

    bundle exec itamae ssh -h default --vagrant ./cookbooks/base_settings/default.rb ./cookbooks/mysql/default.rb
