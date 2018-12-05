require 'gli'
require 'cloudflare_cli/methods/term_table'
require 'cloudflare_cli/methods/output_class'
require 'recursive_open_struct'
require 'cloudflare_cli/send_nested'
require 'cloudflare_cli/tree/accounts'

module CloudflareCli
  class App
    extend GLI::App

    desc 'Access /account endpoints'
    command :accounts do |c|
      c.desc 'list accounts'
      c.command [:list, :all] do |la|
        la.flag :'output-sep', desc: 'choose character to separate output fields', must_match: [:newline, :crlf, :space], required: false, default_value: ' '
        la.flag :output, desc: 'output fields, use multiple times to output multiple fields', multiple: true
        la.switch :table, desc: 'Put some of the output into a table', default_value: true
        la.switch :json, desc: 'output raw json', default_value: false
        la.flag :page, desc: 'page to query', default_value: 1
        la.flag :per_page, desc: 'how many accounts listed per page', must_match: 5..50, default_value: 20
        la.flag [:direction, :dir], desc: 'direction to order results', must_match: %w[asc desc], default_value: 'asc'
        la.action do |global_options, options, args|
          cf_options = options.reject{ |k,v| %w[output output-sep table].include? k }.reject{ |k,v| %i[output output-sep table].include? k }
          js = CloudflareCli::Nodes::Accounts.all(cf_options).body
          if options[:json]
            puts js.to_json
          end
          if options[:table]
            table = CloudflareCli::Methods::TermTable.new('Accounts', js)
            table.make_rows
          end
          if options[:output]
            want = CloudflareCli::Methods::Output.new(options[:output], options, js)
            want.put
          end
        end
      end
    end
  end
end
