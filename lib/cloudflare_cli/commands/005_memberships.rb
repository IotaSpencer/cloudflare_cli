require 'gli'
require 'cloudflare_cli/methods/tables/memberships'
require 'cloudflare_cli/methods/output_class'
require 'recursive_open_struct'
require 'cloudflare_cli/send_nested'

module CloudflareCli
  class App
    extend GLI::App
    desc 'Access /memberships endpoints'
    command :memberships do |c|
      c.desc 'list memberships'
      c.command [:list, :all] do |lm|
        lm.flag :'output-sep', desc: 'choose character to separate output fields', must_match: [:newline, :crlf, :space], required: false, default_value: :space
        lm.flag :output, desc: 'output fields, use multiple times to output multiple fields', multiple: true
        lm.switch :table, desc: 'Put some of the output into a table', default_value: true
        lm.switch :json, desc: 'output raw json', default_value: false
        lm.flag :page, desc: 'page to query', default_value: 1
        lm.flag :per_page, desc: 'how many accounts listed per page', must_match: 5..50, default_value: 20
        lm.flag :order, desc: 'field to order memberships by', must_match: %w[id account name status]
        lm.flag [:direction, :dir], desc: 'direction to order results', must_match: %w[asc desc], default_value: 'asc'
        lm.action do |global_options, options, args|
          cf_options = options.reject{ |k,v| %w[output output-sep table].include? k }.reject{ |k,v| %i[output output-sep table].include? k }
          js = CloudflareCli::Nodes::Memberships.all(cf_options).body
          if options[:json]
            puts js.to_json
          end
          if options[:table]
            table = CloudflareCli::Methods::Tables::Memberships.new('Memberships', js)
            table.make_it_so
            table.beam_me_out
          end
          if options[:output]
            want = CloudflareCli::Methods::Output.new(options[:output], options, js)
            want.put
          end
        end
      end
      c.desc 'show membership details'
      c.command [:get, :show] do |sm|
        sm.flag :'output-sep', desc: 'choose way to separate output fields', must_match: [:newline, :crlf, :space], required: false, default_value: :space
        sm.flag :output, desc: 'output fields', multiple: true
        sm.switch :table, desc: 'put output into a table', default_value: true
        sm.switch :json, desc: 'output raw json', default_value: false
      end
    end
  end
end
