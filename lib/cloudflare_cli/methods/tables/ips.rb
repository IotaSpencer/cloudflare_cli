require 'terminal-table'
require 'recursive_open_struct'

module CloudflareCli
  module Methods
    module Tables
      # Class to output zone results information onto a table
      class Zones
        # @param [String] title Table title
        # @param [Hash] hsh Initialize a TermTable instance
        def initialize(title, hsh)
          @struct = RecursiveOpenStruct.new(hsh, recurse_over_arrays: true)
          @success = @struct.success
          @errors = @struct.errors
          @messages = @struct.messages
          @result = @struct.result
          @table_title = title
          @table = Terminal::Table.new
          @hash = hsh

          @table.title = @table_title
          @table.style = {:border_bottom => false}
        end

        # @return [NilClass]
        # Add a separator to the table
        def add_separator
          @table.add_separator
        end

        # @return [TermTable] term table object
        def table
          @table
        end

        def make_rows
          @table.add_row ['success', @success]
          @table.add_row ['errors', @errors.empty? ? 'none' : @errors]
          @table.add_row ['messages', @messages.empty? ? 'none' : @messages]
          @result.each_with_index do |res, idx|
            @table.add_row ['Account List Number', idx]
            @table.add_row ['Account ID', res.id]
            @table.add_row ['Account Name', res.name]
            @table.add_row ['Settings Hash', "#{res.settings.to_hash}"]
            @table.add_separator
          end
          puts table
        end
      end
    end
  end
end