require "rubyflare"
# Add requires for other files you add to your project here, so
# you just need to require this one file in your bin file

module CloudflareCli
  class State
    # @param [Hash] options Hash of options to initiate the State
    def self.initiate(options)
      @@email = options[:email]
      @@api_key = options["api-key"]
      @@ctx = Rubyflare.connect_with(@@email, @@api_key)
    end
    def self.ctx
      @@ctx
    end
  end
end
class Object
  alias_method :extend_with, :extend
end
require "cloudflare_cli/version"
require "cloudflare_cli/app"
require 'cloudflare_cli/cli'
