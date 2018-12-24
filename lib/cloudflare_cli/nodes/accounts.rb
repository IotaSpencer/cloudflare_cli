require 'rubyflare'
require 'cloudflare_cli/node'
module CloudflareCli
  module Nodes
    # Accounts API Node /accounts
    class Accounts
      include CloudflareCli::Node
      def initialize(options)
        super(options)
      end
      def self.all
        ctx = CloudflareCli::State.ctx
        @response = ctx.get('accounts', options)
      rescue Rubyflare::ConnectionError => e
        puts e.response.body
        raise CloudflareCli::APIError.new(self.name.downcase!,e.response.body, -1)
      end
      def response
        @response
      end
    end
  end
end
