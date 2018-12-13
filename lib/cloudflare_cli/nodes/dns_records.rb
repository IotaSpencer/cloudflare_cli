module CloudflareCli
  module Nodes
    module Zone
      class DnsRecords
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