require 'rubyflare'
require 'cloudflare_cli/node'
module CloudflareCli
  module Nodes
    module Zone
      class Zones
        include CloudflareCli::Node
        def initialize(options)
          super(options)
        end
      # Return Cloudflare Account Zones
        def self.all(options)
          ctx = CloudflareCli::State.ctx
          ctx.get('zones', options)
        rescue Rubyflare::ConnectionError => e
          puts e.response.body
        end
      end
    end
  end
end