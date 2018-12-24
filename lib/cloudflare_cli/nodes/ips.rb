require 'cloud_party'
require 'cloudflare_cli/node'
module CloudflareCli
  module Nodes
    class IPs
      include CloudflareCli::Node
      # There's no options for /ips
      def initialize(options)

      end
      def list(ipv4: false, ipv6: false)
        begin
        if ipv4
          CloudParty::Nodes::IPs.new()
        elsif ipv6
        else

        end
        rescue CloudParty::APIError, CloudParty::RequestError => e
          puts e
          exit 666
        end

      rescue CloudParty::ConnectionError => e
        puts e.response.body
      end
    end
  end
end
