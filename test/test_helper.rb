# typed: false
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/spec'
require 'minitest/reporters'
require 'minitest/fail_fast' if EffectiveTestBot.fail_fast?

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  extend Minitest::Spec::DSL  # For the let syntax
  @timeout ||= ENV.fetch('TIMEOUT', '5').to_i
  Capybara.default_max_wait_time = @timeout # Seconds

  # Add more helper methods to be used by all tests here...
  class ActionDispatch::IntegrationTest
    def login_user
      post sessions_url, params: { user: { username: 'foo', password: 'bar' } }
    end
  end
end

Rails.backtrace_cleaner.remove_silencers!
Rails.backtrace_cleaner.add_silencer { |line| line =~ /minitest/ }
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /effective_test_bot/ }

setup = ['db:schema:load', 'db:fixtures:load', 'test:load_fixture_seeds'].join(' ')
system("rails #{setup} RAILS_ENV=test")

# rails test
# rails test:system
# rails test:bot:environment
# rails test:bot

# rails test:system TOUR=true
# rails test:bot TEST=posts#index
