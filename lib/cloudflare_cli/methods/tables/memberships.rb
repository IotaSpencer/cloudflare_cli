require 'terminal-table'
require 'recursive_open_struct'
require 'cloudflare_cli/methods/tables'
module CloudflareCli
  module Methods
    module Tables
      # Class to output zone results information onto a table
      class Memberships
        include Methods::Table

        def initialize(*args)
          super(*args)
          get_result_tables
        end

        def get_result_tables
          one_dimension_keys = %w[id status]
          inside_nodes = %w[account roles permissions]
          possible_1d_keys = %w[code]
          all_1d_keys = one_dimension_keys + possible_1d_keys
          all_node_keys = inside_nodes
          all_keys = all_node_keys + all_1d_keys
          @results = {}
          @result.each do |res|
            @results[res.name] = {}
            all_1d_keys.each do |key|
              @results[res.name][key] = res[key]
            end
            @results[res.name].compact!
            perms = []
            @results[res.name]['permissions'] = {}
            res.permissions.to_hash.each do |name, values|
              perms << "#{name} -> #{values.keys.join(', ')}"
            end
            @results[res.name]['permissions'] = {value: perms.join("\n"), alignment: :right}
            @results[res.name]['account'] = {value: "#{res.account.name}\n(#{res.account.id})", alignment: :right}
            @results[res.name]['roles'] = res.roles.join(', ')
          end
          @results.each do |key, value|
            add_rows [{value: key, colspan: 2, alignment: :center}]
            value.each do |name, val|
              add_rows [name, val]
              add_separator
            end
            add_separator
          end
        end
      end
    end
  end
end