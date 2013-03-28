require 'simplecov'

ENV["RAILS_ENV"] ||= 'test'

require 'rspec/fire'
require 'rspec/autorun'
require 'gmailish'

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
