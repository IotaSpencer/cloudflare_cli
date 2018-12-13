require 'gli'
require 'json'
require 'cloudflare_cli/nodes'
require 'cloudflare_cli/exceptions'
module CloudflareCli
  # Have a class for the GLI space
  class App
    extend GLI::App
    program_desc 'Interface with the Cloudflare API!'
    program_long_desc "
    Usage is rate-limited by Cloudflare itself, not the gem.

    See https://api.cloudflare.com/#getting-started-requests for information
    on the API and the linked anchor for rate-limiting specifically.
    "

    version CloudflareCli::VERSION
    config_file '.cfcli/config'
    subcommand_option_handling :normal
    arguments :strict
    wrap_help_text :verbatim
    hide_commands_without_desc true
    preserve_argv true
    commands_from 'cloudflare_cli/commands'
    flag [:email], desc: 'Cloudflare E-Mail', default_value: '', arg_name: 'EMAIL', mask: true
    flag ['api-key'], desc: 'Cloudflare API Key', default_value: '', arg_name: 'APIKEY', mask: true
    switch 'legal', desc: 'output legal disclaimer, not reading does not excuse', negatable: false
    around do |global_options, command, options, arguments, code|
      CloudflareCli::State.initiate(global_options)
      code.call
    end
    desc <<~DESC
initialize $HOME/.cfcli/zones.yml with zone ids to make lookup easier.
This means when you use, 'dns-records add ZONE 'name' "content"'
it will use the saved id instead of asking cloudflare for it again.
DESC

    command :initzones do |c|
      c.switch :overwrite, negatable: false
    end
    arg :code, [:multiple, :optional]
    command :debug do |c|
      c.action do |global, options, arguments|
        puts arguments.inspect
        puts global.inspect
        puts options.inspect
        eval(arguments.join(' '))
      end
    end
    pre do |global_options,command,options, args|
      if options[:legal]
        exit_now!(CloudflareCli::Strings::Legal, 0)
        true
      end
      CloudflareCli::CLI.validate_options(command, options)

      true
    end
  end
end
