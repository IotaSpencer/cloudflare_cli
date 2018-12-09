
module CloudflareCli
  module Nodes
    autoload :IPs, 'cloudflare_cli/nodes/ips'
    autoload :Zone, 'cloudflare_cli/nodes/zones'
    autoload :Accounts, 'cloudflare_cli/nodes/accounts'
    autoload :Memberships, 'cloudflare_cli/nodes/memberships'

    module Methods
      def self.included(klass)
        define_method(:name) do

          "#{klass.name.split('::').last.downcase}"
        end
      end
      def initialize(options)
        options.reject!{ |k,v| %w[output output-sep table].include? k }.reject{ |k,v| %i[output output-sep table].include? k }
        @options = options
      end
    end
  end
end
