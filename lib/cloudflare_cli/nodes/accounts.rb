require "rubyflare"

module CloudflareCli
  module Nodes
    # Accounts API Node /accounts
    class Accounts
      def self.all(options)
        ctx = CloudflareCli::State.ctx
        ctx.get('accounts', options)
      rescue Rubyflare::ConnectionError => e
        puts e.response.body
        raise
      end
    end
  end
end
