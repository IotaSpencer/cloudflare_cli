require 'gli'
require 'cloudflare_cli/methods/tables/zones'
require 'cloudflare_cli/methods/output_class'
require 'recursive_open_struct'
require 'cloudflare_cli/send_nested'

module CloudflareCli
  class App
    extend GLI::App

    desc "Use all the non-dns '/zones/*' endpoints"
    command :zones do |c|
      c.desc 'list all zones or filter them'
      c.command [:all, :list] do |lz|
        lz.example "#{exe_name} zones [list|all]", desc: 'List all zones without filtering them'
        lz.example "#{exe_name} zones [list|all] --name example.com", desc: 'List by filter'
        lz.example "#{exe_name} zones [list|all] --status active", desc: 'List active zones'
        lz.example "#{exe_name} zones [list|all] --order name --direction desc", desc: 'List zones and sort by name in descending order'
        lz.example "#{exe_name} zones [list|all] --name example.com --output success --output result[0].id", desc: 'list zones and output some fields, for use with scripts'
        lz.flag [:name], desc: 'Zone name to search for, max length is 253 characters', arg_name: 'NAME'
        lz.flag [:status], desc: 'Status of the zone', must_match: %w[active pending initializing moved deleted deactivated], required: false, arg_name: 'STATUS', default_value: 'active'
        lz.flag :page, desc: 'Page number of paginated results', type: Integer, arg_name: 'PAGE#', default_value: 1
        lz.flag :per_page, desc: 'Number of zones per page', default_value: 20, must_match: 5..50, arg_name: '##'
        lz.flag :order, desc: 'Field to order zones by', must_match: %w[name status email], arg_name: 'ORDER', default_value: 'name'
        lz.flag %i[direction dir], desc: 'Direction to order zones', must_match: %w[asc desc], arg_name: 'DIR', default_value: 'asc'
        lz.flag :match, desc: 'Whether to match all search requirements or at least one (any)', must_match: %w[any all], default_value: 'all', arg_name: 'MATCH'
        lz.flag :'output-sep', desc: 'choose character to separate output fields', must_match: [:newline, :crlf, :space], required: false, default_value: ' '
        lz.flag :output, desc: 'output fields, use multiple times to output multiple fields', multiple: true
        lz.switch :table, desc: 'Put some of the output into a table', default_value: true
        lz.switch :json, desc: 'output the full raw json', negatable: true
        lz.action do |global_options, options, args|
          cf_options = options.reject{ |k,v| %w[output output-sep table].include? k }.reject{ |k,v| %i[output output-sep table].include? k }
          js = CloudflareCli::Nodes::Zone::Zones.all(cf_options).body
          if options[:json]
            puts js.to_json
          end
          if options[:table]
            table = CloudflareCli::Methods::Tables::Zones.new('Zones', js)
            table.make_it_so
            table.beam_me_out
          end
          if options[:output]
            want = CloudflareCli::Methods::Output.new(options[:output], options, js)
            want.put
          end
        end
      end
      c.desc 'Create a zone'
      c.command [:new, :create] do |cz|
        cz.switch :'jump-start', desc: 'Automatically attempt to fetch existing DNS records', negatable: true, default_value: false
        cz.flag :name, desc: 'The domain name', must_match: /^([a-zA-Z0-9][\-a-zA-Z0-9]*\.)+[\-a-zA-Z0-9]{2,20}$/
        cz.flag :'account-name', desc: "The account's name, this is shown through Home->Account Home->Configurations->Preferences->Account Name"
      end
      c.default_command :all
    end
  end
end
