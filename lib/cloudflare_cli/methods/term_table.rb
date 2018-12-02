require 'terminal-table'
require 'recursive_open_struct'
require 'table_print'
module CloudflareCli
  module Methods
    module Zones
      class TermTable
        # @param [String] title Table title
        # @param [Hash] hsh Initialize a TermTable instance
        def initialize(title, hsh)
          @table_title = title
          @table = Terminal::Table.new
          @hash = hsh
          @struct = RecursiveOpenStruct.new(hsh, recurse_over_arrays: true)
          @table.title = @table_title
          #@table.style = {:width => 80}
        end

        # @return [NilClass]
        def add_separator
          @table.add_separator
        end

        def table
          @table
        end

        def make_rows
          tp.set :capitalize_headers, false
          @struct.result.each do |res|
            puts res
          end
          tp @struct, {'result.id' => {width: 40, display_name: 'ID'}}, {'result.name' => {display_name: 'Zone Name'}}

        end
      end
    end
  end
end