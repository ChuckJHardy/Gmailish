require 'simplecov'
require 'coveralls'

Coveralls.wear!

ENV["RAILS_ENV"] ||= 'test'

require 'rspec/fire'
require 'rspec/autorun'
require 'gmailish'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.order = "random"
  config.filter_run :focus => true
  config.color_enabled = true
  config.run_all_when_everything_filtered = true

  config.include RSpec::Fire
end

RSpec::Fire.configure do |config|
  config.verify_constant_names = true
end
