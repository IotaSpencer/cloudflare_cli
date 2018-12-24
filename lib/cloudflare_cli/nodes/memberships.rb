require 'cloud_party'
require 'cloudflare_cli/exceptions'
require 'cloudflare_cli/node'
module CloudflareCli
  module Nodes
    # Memberships API Node /memberships
    class Memberships
      include CloudflareCli::Node
      #base_uri '/memberships'
      def initialize(options)
        super(options)

      end

      def all(as)
        case as
        when :json
          return CloudParty::Nodes::Memberships.new(@options).list.body
        when :obj
          return CloudParty::Nodes::Memberships.new(@options).list.inspect
        else
          return CloudParty::Nodes::Memberships.new(@options).list.inspect
        end
      end
    end
  end
end
# raise CloudflareCli::APIError.new('memberships',
# e.response.body[:errors].each {|x| x.fetch_values(:code, :message)}
# .join(', '), -1)
