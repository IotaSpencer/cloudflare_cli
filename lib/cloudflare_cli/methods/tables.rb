require 'terminal-table'
require 'recursive_open_struct'

module CloudflareCli
  module Methods
    module Table
      # Class to output zone results information onto a table

      # @param [String] title Table title
      # @param [Hash] hsh Initialize a TermTable instance
      def initialize(title, hsh)
        @struct = RecursiveOpenStruct.new(hsh, recurse_over_arrays: true)
        @success = @struct.success
        @errors = @struct.errors
        @messages = @struct.messages
        @result = @struct.result
        @paging = @struct.result_info
        @table_title = title
        @table = Terminal::Table.new
        @hash = hsh
        @table.title = @table_title
        #@table.style = {:border_bottom => false}
      end

      def make_it_so
        make_first_rows

      end

      def beam_me_out
        puts table
      end

      # @return [TerminalTable] term table object
      def table
        @table
      end

      def add_rows(*array)
        array.each do |entry|
          @table.add_row entry
        end
      end
      def add_separator
        @table.add_separator
      end
      def make_first_rows
        @table.add_row ['success', @success]
        @table.add_row ['errors', @errors.empty? ? 'none' : @errors]
        @table.add_row ['messages', @messages.empty? ? 'none' : @messages]
      end
    end
  end
end