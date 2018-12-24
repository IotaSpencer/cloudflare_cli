require 'rubyflare'
require 'cloudflare_cli/node'
module CloudflareCli
  module Nodes
    module Zone
      class DnsRecords
        include CloudflareCli::Node
        def initialize(options)
          super(options)
        end
        def all(options)
          ctx = CloudflareCli::State.ctx
          ctx.get('zones', options)
        rescue Rubyflare::ConnectionError => e
          puts e.response.body
        end

        def add(options)
          ctx = CloudflareCli::State.ctx
          response = ctx.post('zones/dns_records/', @options)
          unless response.errors.empty?
            why = response.errors
            raise CloudflareCli::APIError.new('zones/dns_records', why, -1)
          end

        rescue Rubyflare::ConnectionError => e
          raise CloudflareCli::APIError.new('memberships', e.response.body[:errors].each {|x| x.fetch_values(:code, :message)}.join(', '), -1)
        end
      end
    end
  end
end