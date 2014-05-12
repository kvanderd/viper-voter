ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
# require "minitest/rails"

require 'minitest/rails/capybara'
require 'minitest/focus'
require 'minitest/colorize'
# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:


# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

    def self.prepare
      # Add code that needs to be executed before test suite start
    end
    prepare

    def setup
      # Add code that need to be executed before each test
    end

    def teardown
      # Add code that need to be executed after each test
    end
end
