require "gli"
require "cloudflare_cli/tree"

module CloudflareCli
  class App
    extend GLI::App

    program_desc "Describe your application here"

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

    desc "Describe zones here"
    arg_name "Describe arguments to zones here"
    command :zones do |c|
      c.action do |global_options, options, args|
        puts "zones command ran"
      end
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
      c.action do |global_options, options, args|
        puts CloudflareCli::Tree::IPs.new(global_options['email'], global_options['api-key']).get
      end
    end

    desc "Describe ssl here"
    arg_name "Describe arguments to ssl here"
    command :ssl do |c|
      c.action do |global_options, options, args|
        puts "ssl command ran"
      end
    end
    #
    # pre do |global,command,options,args|
    #   # Pre logic here
    #   # Return true to proceed; false to abort and not call the
    #   # chosen command
    #   # Use skips_pre before a command to skip this block
    #   # on that command only
    #   true
    # end
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
