ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../config/environment", __dir__)
require "rspec/rails"
require "shoulda/matchers"
require "webmock/rspec"

Dir[Rails.root.join("spec", "support", "**", "*.rb")].each { |f| require f }

OmniAuth.config.test_mode = true

RSpec.configure do |config|
  config.include WebmockHelpers
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
end
