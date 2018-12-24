require 'gli'
require 'awesome_print'
module CloudflareCli
  class App
    extend GLI::App

    desc "Return Cloudflare IPs"
    command :ips do |c|
      c.switch [:pretty], desc: "make the display of the ips pretty", negatable: false
      c.switch [:json], desc: 'output the json', negatable: false
      c.switch [:table], desc: 'output information into a table', negatable: false
      c.flag [:output], desc: 'output based on fields', multiple: true, default_value: nil
      c.switch [:'4'], desc: 'only grab ipv4 cidrs', negatable: false
      c.switch [:'6'], desc: 'only grab ipv6 cidrs', negatable: false

      c.desc "list out cloudflare's IPs"
      c.command :list do |li|

        li.switch [:pretty], desc: "make the display of the ips pretty", negatable: false
        li.switch [:json], desc: 'output the json', negatable: false
        li.switch [:table], desc: 'output information into a table', negatable: false
        li.flag [:output], desc: 'output based on fields', multiple: true, default_value: nil
        li.flag [:'output-sep'], desc: 'separate fields with character', must_match: %i[space newline crlf]
        li.switch [:'4'], desc: 'only grab ipv4 cidrs', negatable: false
        li.switch [:'6'], desc: 'only grab ipv6 cidrs', negatable: false
        li.action do |global_options, options, args|
          if options[:json]
            if options[:'4'] and not options[:'6']
              if options[:pretty]
                ap CloudParty::Nodes::IPs.new.list.result.ipv4_cidrs
              else
                puts CloudParty::Nodes::IPs.new.list.result.ipv4_cidrs.to_json
              end
            elsif not options[:'4'] and options[:'6']
              if options[:pretty]
                ap CloudParty::Nodes::IPs.new.list.result.ipv6_cidrs
              else
                puts CloudParty::Nodes::IPs.new.list.result.ipv6_cidrs.to_json
              end
            else
            end
          elsif options [:table]

          elsif !options[:output].empty?

          end
        end
      end
      c.default_desc 'list out cloudflare ips'
      c.action do |global_options, options, arguments|
        if options[:json]
          if options[:'4'] and not options[:'6']
            if options[:pretty]
              ap CloudParty::Nodes::IPs.new.list.result.ipv4_cidrs
            else
              puts CloudParty::Nodes::IPs.new.list.result.ipv4_cidrs.to_json
            end
          elsif not options[:'4'] and options[:'6']
            if options[:pretty]
              ap CloudParty::Nodes::IPs.new.list.result.ipv6_cidrs
            else
              puts CloudParty::Nodes::IPs.new.list.result.ipv6_cidrs.to_json
            end
          else
          end
        end
      end
    end
  end
end
