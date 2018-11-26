require 'httparty'

module CloudflareCli
  module APITree
    class IPs
      include HTTParty
      base_uri 'https://api.cloudflare.com/client/v4/'

    end
  end
end
