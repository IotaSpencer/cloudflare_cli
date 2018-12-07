require 'cloudflare_cli/methods/date_parser'
require 'terminal-table'
require 'recursive_open_struct'
require 'cloudflare_cli/methods/tables'
require 'date'
require 'active_support/time_with_zone'

module CloudflareCli
  module Methods
    module Tables
      # Class to output zone results information onto a table
      class Zones
        include Methods::Table
        def initialize(*args)
          super(*args)
          get_result_tables
        end
        def get_result_tables
          one_dimension_keys = %w[status paused type id development_mode original_registrar original_dnshost created_on modified_on activated_on]
          inside_nodes = %w[owner account permissions plan plan_pending original_name_servers]
          known_keys = one_dimension_keys + inside_nodes
          @results = {}
          @result.each do |res|
            @results[res.name] = {}
            one_dimension_keys.each do |key|
              if %w[created_on modified_on activated_on].include? key
                @results[res.name][key] = DateTime.parse(res[key]).strftime('%B %e, %Y, at %H:%M:%S')
                    #.strftime('%B %e, %Y at %I:%M %p')
              else
                @results[res.name][key] = res.dig(key)
              end

            end
            permissions = res.permissions.group_by { |x| x[/[a-zA-Z]+/] }.values
            perms = []
            permissions.each do |x|
              perms << x.join(', ')
            end

            @results[res.name]['permissions'] = {value: perms.join("\n"), alignment: :right}
            @results[res.name]['account'] = {value: "#{res.account.name} (#{res.account.id})"}
            @results[res.name]['owner'] = {value: "#{res.owner.email}\n(#{res.owner.id}) Type: #{res.owner.type}"}
            @results[res.name]['original_name_servers'] = {value: res.original_name_servers.join("\n")}
            @results[res.name]['plan'] = {}
            plan_tpl = <<~PLAN
            {
              id: #{res.plan.id},
              name: #{res.plan.name},
              price: #{res.plan.price},
              currency: #{res.plan.currency},
              frequency: #{res.plan.frequency.eql?('') ? 'none' : res.plan.frequency},
              legacy_id: #{res.plan.legacy_id},
              is_subscribed: #{res.plan.is_subscribed},
              can_subscribe: #{res.plan.can_subscribe}
            }
            PLAN
            @results[res.name]['plan'][:value] = plan_tpl
            @results[res.name]['plan'].merge({alignment: :left})
          end
          @results.each do |key, value|
            add_rows [{value: key, colspan: 2, alignment: :center}]
            add_separator
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