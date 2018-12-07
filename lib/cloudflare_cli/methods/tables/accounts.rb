require 'terminal-table'
require 'recursive_open_struct'
require 'cloudflare_cli/methods/tables'
module CloudflareCli
  module Methods
    module Tables
      # Class to output zone results information onto a table
      class Accounts
        include Methods::Table

        def initialize(*args)
          super(*args)
          @result.each_with_index do |res, idx|
            self.add_rows ['Account List Number', idx]
            self.add_rows ['Account ID', res.id]
            self.add_rows ['Account Name', res.name]
            self.add_rows ['Settings Hash', "#{res.settings.to_hash}"]
            self.add_separator
          end

        end
      end
    end
  end
end