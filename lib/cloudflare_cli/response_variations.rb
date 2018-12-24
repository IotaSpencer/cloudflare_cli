require 'yaml'
require 'recursive_open_struct'
require 'pathname'
# rubocop:disable
module CloudflareCli
  class ResponseVariations
    @@struct = RecursiveOpenStruct.new(HASH)

    attr_reader :path_dotted
    def initialize(path_array)
      @path_dotted = path_array.join('.')

    end
  end
end