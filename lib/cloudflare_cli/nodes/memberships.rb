require 'rubyflare'
require 'cloudflare_cli/exceptions'
require 'cloudflare_cli/nodes/memberships'
module CloudflareCli
  module Nodes
    # Accounts API Node /accounts
    class Memberships
      include CloudflareCli::Nodes
      def initialize(options)
        options.reject!{ |k,v| %w[output output-sep table json].include? k }.reject!{ |k,v| %i[output output-sep table json].include? k }
        @options = options
      end
      def all
        ctx = CloudflareCli::State.ctx
        response = ctx.get('memberships', @options)
        unless response.errors.empty?
          why = response.errors
          raise CloudflareCli::APIError.new('memberships', why, -1)
        end
        response
      rescue Rubyflare::ConnectionError => e
        raise CloudflareCli::APIError.new('memberships', e.response.body[:errors].each {|x| x.fetch_values(:code, :message)}.join(', '), -1)
      end
    end
  end
end
