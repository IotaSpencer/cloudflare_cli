require 'yaml'
require 'pathname'
require 'recursive_open_struct'
require "#{Pathname.new(__FILE__).dirname.join('send_nested')}"
module CloudflareCli
  class CLI
    yaml = Pathname.new(__FILE__ ).dirname.join('options.yml')
    @@yml = YAML.load_file(yaml)
    @@struct = RecursiveOpenStruct.new(@@yml)
    def CLI.validate_options(command_tree, options_hash)
      puts command_tree.name
      #options_hash.delete_if do |k,v|
      #  @@struct.app.commands.send_nested(command_tree).conflicts_with.include? k
      #end
      options_hash
    end
  end
end