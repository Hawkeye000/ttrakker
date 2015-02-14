require 'bundler/setup'
Bundler.setup

require 'ttrakker'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.configure do |config|
  # config.treat_symbols_as_metadata_keys_with_true_values = true
end
