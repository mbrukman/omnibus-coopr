source 'https://rubygems.org'

group :development do
  gem 'rake'
  gem 'rubocop'
end

# Use Berkshelf for resolving cookbook dependencies
gem 'berkshelf', '~> 3.0'
gem 'hashie', '< 3.0'

# Install omnibus software
gem 'omnibus', '~> 3.1'
gem 'omnibus-software', github: 'opscode/omnibus-software', ref: 'omnibus/3.2-stable'

# Use Test Kitchen with Vagrant for converging the build environment
gem 'test-kitchen',    '~> 1.2'
gem 'kitchen-vagrant', '~> 0.14'
