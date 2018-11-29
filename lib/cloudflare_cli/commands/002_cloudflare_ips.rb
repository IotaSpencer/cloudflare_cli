require 'gli'
module CloudflareCli
  class App
    extend GLI::App

    desc "Return Cloudflare IPs"
    command :ips do |c|
      c.desc "list out cloudflare's IPs"
      c.command :list do |li|

        li.switch [:pretty, :p], desc: "make the display of the ips pretty", negatable: false

        li.action do |global_options, options, args|
          if options[:pretty]
            pp CloudflareCli::Endpoints::IPs.list.body
          else
            puts CloudflareCli::Endpoints::IPs.list.body
          end
        end
      end
      c.default_command :list
    end
  end
end
