require 'rubyflare'

module CloudflareCli
  module Tree
    class IPs
      def initialize(email = nil, api_key = nil)
        @email = email
        @api_key = api_key
      end
      # Return Cloudflare IP CIDRs
      def get
        connection = Rubyflare.connect_with(@email, @api_key)
        connection.get('ips')
      end
    end
  end
end
