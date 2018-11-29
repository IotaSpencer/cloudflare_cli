require "rubyflare"

module CloudflareCli
  module Endpoints
    class IPs
      def self.list

        ctx = CloudflareCli::State.ctx
        ctx.get('ips')
      rescue Rubyflare::ConnectionError => e
        #  puts e.response.body
      end
    end
  end
end
