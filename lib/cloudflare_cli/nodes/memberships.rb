require "rubyflare"

module CloudflareCli
  module Nodes
    # Accounts API Node /accounts
    class Memberships
      def self.all(options)
        ctx = CloudflareCli::State.ctx
        ctx.get('memberships', options)
      rescue Rubyflare::ConnectionError => e
        puts e.response.body
        raise
      end
    end
  end
end
