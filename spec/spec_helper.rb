require 'bundler/setup'
require 'crossdomain'

RSpec.configure do |config|

  config.formatter = 'documentation'
  config.color = true
  config.mock_framework = :rspec
  config.order = 'random'
  config.fail_fast = false
end
