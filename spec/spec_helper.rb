require 'bundler/setup'
Bundler.setup

Dir[File.join(File.dirname(__FILE__), '..', 'src', '**', '*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
