require "gli"
require "json"
require "cloudflare_cli/tree"

module CloudflareCli
  class App
    extend GLI::App
    program_desc "Interface with the Cloudflare API!"

    program_long_desc <<~HEREDOC

                        #{exe_name} is an interface into the Cloudflare API,
    usage is rate-limited by Cloudflare itself, not the gem.

    See https://api.cloudflare.com/#getting-started-requests for information
    on the API and the linked anchor for rate-limiting specifically.
                      HEREDOC

    version CloudflareCli::VERSION

    config_file ".cfcli/config"
    subcommand_option_handling :normal
    arguments :strict
    wrap_help_text :verbatim

    flag [:email], desc: "Cloudflare E-Mail", default_value: "", arg_name: "EMAIL"
    flag ["api-key"], desc: "Cloudflare API Key", default_value: "", arg_name: "APIKEY"

    desc "Describe user here"
    arg_name "Describe arguments to user here"
    command :user do |c|
      c.desc "Describe a switch to user"
      c.switch :s

      c.desc "Describe a flag to user"
      c.default_value "default"
      c.flag :f
      c.action do |global_options, options, args|

        # Your command logic here

        # If you have any errors, just raise them
        # raise "that command made no sense"

        puts "user command ran"
      end
    end

    desc "Describe account here"
    arg_name "Describe arguments to account here"
    command :account do |c|
      c.action do |global_options, options, args|
        puts "account command ran"
      end
    end

    desc "Describe orgs here"
    arg_name "Describe arguments to orgs here"
    command :orgs do |c|
      c.action do |global_options, options, args|
        puts "orgs command ran"
      end
    end

    desc "Describe invites here"
    arg_name "Describe arguments to invites here"
    command :invites do |c|
      c.action do |global_options, options, args|
        puts "invites command ran"
      end
    end

    desc "Use the '/zones/*' endpoints"
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

    desc "Describe dns here"
    arg_name "Describe arguments to dns here"
    command :dns do |c|
      c.action do |global_options, options, args|
        puts "dns command ran"
      end
    end

    desc "Describe vdns here"
    arg_name "Describe arguments to vdns here"
    command :vdns do |c|
      c.action do |global_options, options, args|
        puts "vdns command ran"
      end
    end

    desc "Return Cloudflare IPs"
    command :ips do |c|
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
    end

    desc "Describe ssl here"
    arg_name "Describe arguments to ssl here"
    command :ssl do |c|
      c.action do |global_options, options, args|
        puts "ssl command ran"
      end
    end
    around do |global_options, command, options, arguments, code|
      CloudflareCli::State.initiate(global_options)
      code.call
    end
    pre do |global, command, options, args|
      # Pre logic here
      # Return true to proceed; false to abort and not call the
      # chosen command
      # Use skips_pre before a command to skip this block
      #  on that command only
      true
    end
    #
    # post do |global,command,options,args|
    #   # Post logic here
    #   # Use skips_post before a command to skip this
    #   # block on that command only
    # end
    #
    # on_error do |exception|
    #   # Error logic here
    #   # return false to skip default error handling
    #   true
    # end
  end
end
