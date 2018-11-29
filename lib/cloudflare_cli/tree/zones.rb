require "rubyflare"

module CloudflareCli
  module Endpoints
    class Zones

      # Return Cloudflare Account Zones
      def self.all(options)
        puts options
        #begin
        #  ctx = CloudflareCli::State.ctx
        #  ctx.get('zones')
        #rescue Rubyflare::ConnectionError => e
        #  puts e.response.body
        #end
      end
    end
  end
end
