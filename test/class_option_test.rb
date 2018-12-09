require_relative './test_helper'
require 'minitest/autorun'
require 'yaml'
require_relative '../lib/cloudflare_cli'
# rubocop:disable Style/MethodLength
class CloudflareCliTest < Minitest::Test
  def setup
    @app = CloudflareCli::App

  end
  def test_that_version_option_works
    assert_output(/#{CloudflareCli::VERSION}/, '') {
      @app.run(%w(--version))
      @app.run(%w(-v))
    }
  end
end
# rubocop:enable Style/MethodLength