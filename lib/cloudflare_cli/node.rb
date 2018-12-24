require 'uri'
require 'cloud_party'
module CloudflareCli
  module Node
    def self.included(base)
      def remove_cli_options(options)
        begin
          options.reject { |k,v|
            %w[output output-sep table json pretty obj].include? k.to_s
          }
        rescue
          # Don't do anything
          options
        end
      end

    end
    def initialize(options = nil)
      cf_options = self.remove_cli_options(options)
      @options = cf_options
    end
  end
end
