require 'yaml'
require 'pathname'
require 'vine'
module CloudflareCli
  class CLI

    yaml = Pathname.new(__FILE__ ).dirname.join('options.yml')
    @@yml = YAML.load_file(yaml)
    @@struct = @@yml
    def CLI.validate_options(command, options)
      arg_path = command.name_for_help.join('.')
      new_options = {}
      options.each do |k,v|
        if v.is_a? Array
          if v.empty?
            new_options[k.to_sym] = false
          end
        else
          new_options[k.to_sym] = v
        end
      end
      conflicting_options = @@struct.access(arg_path+'.'+'conflicts')
      conflicted = new_options.find_all do |k,v|
        conflicting_options.include? k.to_sym
      end
      conflicted_options = conflicted.to_h.select {|k,v| conflicted.to_h[k] }.keys
      conflicted_count = conflicted.to_h.values.count{|x| x}
      if conflicted_count > 1
        raise CloudflareCli::FlagSwitchConflictError.new(*conflicted_options)
      end
    end
  end
end
