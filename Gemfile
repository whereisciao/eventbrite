source 'https://rubygems.org'

gem 'rake'
gem 'yard'

group :development do
  gem 'pry'
  platforms :ruby_19, :ruby_20, :ruby_21 do
    gem 'pry-stack_explorer'
    gem 'redcarpet'
  end
end

group :test do
  gem 'backports'
  gem 'coveralls', :require => false
  gem 'mime-types', '~> 1.25', :platforms => [:jruby, :ruby_18]
  gem 'rspec', '>= 2.14'
  gem 'rspec-its'
  gem 'rubocop', '>= 0.20', :platforms => [:ruby_19, :ruby_20, :ruby_21]
  gem 'simplecov', :require => false
  gem 'timecop', '0.6.1'
  gem 'webmock', '1.17.4'
  gem 'yardstick'
  gem 'guard'
  gem 'guard-rspec'
  gem 'psych', '>= 2.0.5'
  gem 'faker'
  gem 'factory_girl'
end

gemspec