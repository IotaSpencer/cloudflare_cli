require "rubyflare"

module CloudflareCli
  module Nodes
    module Zone
      class Zones
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