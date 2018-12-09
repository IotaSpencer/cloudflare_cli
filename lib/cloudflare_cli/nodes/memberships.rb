require 'rubyflare'
require 'cloudflare_cli/exceptions'
module CloudflareCli
  module Nodes
    # Accounts API Node /accounts
    class Memberships
      include CloudflareCli::Nodes::Methods
      def all
        ctx = CloudflareCli::State.ctx
        response = ctx.get(self.name, @options)
        unless response.errors.empty?
          why = response.errors
          raise CloudflareCli::APIError.new(self.name, why, -1)
        end
        response
      end
    end
  end
end
