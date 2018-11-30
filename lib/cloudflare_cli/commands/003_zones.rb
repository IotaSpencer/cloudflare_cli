require 'gli'
module CloudflareCli
  class App
    extend GLI::App

    desc "Use all the non-dns '/zones/*' endpoints"
    command :zones do |c|
      c.desc "list all zones or filter them"
      c.command [:all, "list-zones"] do |lz|
        lz.example "#{exe_name} zones [list-zones|all]", desc: "List all zones without filtering them"
        lz.flag [:name], desc: "Zone name to search for"
        lz.action do |global_options, options, args|
          puts CloudflareCli::Endpoints::Zones.all(options)
        end
      end
      c.action do |global_options, options, args|
      end
      c.default_command false
    end
  end
end
