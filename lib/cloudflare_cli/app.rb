require 'gli'
require 'json'
require 'cloudflare_cli/tree'

module CloudflareCli
  # Have a class for the GLI space
  class App
    extend GLI::App
    program_desc 'Interface with the Cloudflare API!'

    program_long_desc <<-HEREDOC

    #{exe_name} is an interface into the Cloudflare API,
    usage is rate-limited by Cloudflare itself, not the gem.

    See https://api.cloudflare.com/#getting-started-requests for information
    on the API and the linked anchor for rate-limiting specifically.
    HEREDOC

    version CloudflareCli::VERSION

    config_file '.cfcli/config'
    subcommand_option_handling :normal
    arguments :strict
    wrap_help_text :verbatim

    commands_from 'cloudflare_cli/commands'
    flag [:email], desc: 'Cloudflare E-Mail', default_value: '', arg_name: 'EMAIL', mask: true
    flag ['api-key'], desc: 'Cloudflare API Key', default_value: '', arg_name: 'APIKEY', mask: true

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
