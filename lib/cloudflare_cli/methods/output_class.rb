require 'recursive_open_struct'
module CloudflareCli
  module Methods
    module Zones
      class Output
        def initialize(fields, options, hsh)
          @fields = fields
          @options = options
          @hsh = hsh
          @struct = RecursiveOpenStruct.new(hsh, recurse_over_arrays: true)
        end
        def get_fields(fields = @fields)
          fields.each do |path|
            print @struct.send_nested(path)
            case @options[:'output-sep']
            when :newline
              print "\n"
            when :space
              print ' '
            when :crlf
              print "\r\n"

            end
          end

        end
        def put
          self.get_fields
        end
      end
    end
  end
end