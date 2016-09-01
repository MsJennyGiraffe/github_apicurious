ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

require 'capybara/rails'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  provider: 'github',
  extra: {
    raw_info: {
      uid: "1",
      name: "Jenny",
      avatar_url: "https://avatars.githubusercontent.com/u/14857182?v=3",
      login: "MsJennyGiraffe",
      email: "test@test.com",
    }
  },
  credentials: {
    token: ENV["GITHUB_TOKEN"],
    secret: ENV["GITHUB_TOKEN"]
  }
})

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.filter_rails_from_backtrace!
end
