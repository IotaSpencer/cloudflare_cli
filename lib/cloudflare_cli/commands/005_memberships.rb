require 'awesome_print'
require 'cloudflare_cli/methods/output_class'
require 'cloudflare_cli/methods/tables/memberships'
require 'cloudflare_cli/nodes/memberships'
require 'cloudflare_cli/send_nested'
require 'gli'
require 'pry'
require 'recursive_open_struct'

module CloudflareCli
  class App
    extend GLI::App
    desc 'Access /memberships endpoints'
    command :memberships do |c|
      c.desc 'list memberships'
      c.command [:list, :all] do |lm|
        lm.flag :'output-sep', desc: 'choose character to separate output fields', must_match: [:newline, :crlf, :space], required: false, default_value: nil
        lm.flag :output, desc: 'output fields, use multiple times to output multiple fields', multiple: true
        lm.switch :table, desc: 'Put some of the output into a table', default_value: false
        lm.switch :pretty, desc: 'make output of json prettier', default_value: false, negatable: false
        lm.switch :json, desc: 'output raw json', default_value: false
        lm.switch :obj, desc: 'output as Ruby object (only useful for debugging', default_value: false
        lm.flag :page, desc: 'page to query', default_value: 1
        lm.flag :per_page, desc: 'how many accounts listed per page', must_match: 5..50, default_value: 20
        lm.flag :order, desc: 'field to order memberships by', must_match: %w[id account name status]
        lm.flag [:direction, :dir], desc: 'direction to order results', must_match: %w[asc desc], default_value: 'asc'
        lm.action do |global_options, options, args|
          send_options = options.clone
          if options[:json] and not options[:table] and options[:output].empty?
            js = CloudflareCli::Nodes::Memberships.new(send_options).all(:json)
            if options[:pretty]
              ap JSON.parse(js.to_json)
            else
              puts js.to_json
            end
          elsif options[:table] and not options[:json] and options[:output].empty?
            table = CloudflareCli::Methods::Tables::Memberships.new('Memberships', CloudflareCli::Nodes::Memberships.new(send_options).all(:json))
            table.make_it_so
            table.beam_me_out
          elsif not options[:output].empty? and options[:'output-sep'] and not options[:table] and not options[:json]
            want = CloudflareCli::Methods::Output.new(options[:output], options, js)
            want.put
          elsif options[:output].empty? and not options[:'output-sep'] and options[:obj] and not options[:table]
            puts CloudflareCli::Nodes::Memberships.new(send_options).all(:obj)
          else
          end
        end
      end
      c.desc 'show membership details'
      c.command [:get, :show] do |sm|
        sm.flag :'output-sep', desc: 'choose way to separate output fields', must_match: [:newline, :crlf, :space], required: false, default_value: :space
        sm.flag :output, desc: 'output fields', multiple: true
        sm.switch :table, desc: 'put output into a table', default_value: true
        sm.switch :json, desc: 'output raw json', default_value: false
        sm.flag :id, desc: 'retrieve a membership by ID', arg_name: 'ID'
      end
    end
  end
end
