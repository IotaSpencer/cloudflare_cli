require 'recursive_open_struct'
module CloudflareCli
  module Methods
    # Class to output information
    class Output
      def initialize(fields, options, hsh)
        @fields = fields
        @options = options
        @hsh = hsh
        @success = hsh[:success]
        @errors = hsh[:errors]
        @messages = hsh[:messages]
        @result = hsh[:result]
        @struct = RecursiveOpenStruct.new(hsh, recurse_over_arrays: true)
      end

      # @param [Array] fields fields to output (usually gotten from @fields on initialize)
      # @return [NilClass]
      def get_fields(fields = @fields)
        fields.each do |path|
          print @struct.send_nested(path, with_indifferent_access: true)
          case @options[:'output-sep']
          when :newline
            print "\n"
          when :space
            print ' '
          when :crlf
            print "\r\n"
          else
            raise ArgumentError.new("This shouldn't happen but the valid options are 'newline', 'space', 'crlf'")
          end
        end
      end
      # @return [NilClass]
      def put
        self.get_fields
      end
    end
  end
end