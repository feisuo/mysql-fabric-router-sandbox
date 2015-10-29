# how to setup

    bundle install --path vendor/bundler

# how to provision

    bundle exec itamae ssh -h default --vagrant ./cookbooks/base_settings/default.rb ./cookbooks/dotfiles/default.rb ./cookbooks/mysql/default.rb
