require 'yaml'
require 'recursive_open_struct'
require 'pathname'
# rubocop:disable
module CloudflareCli
  class ResponseVariations
    HASH = {
              :accounts => {
                  :list => {

                      :nodes => %w[settings]

                  }
              }
    }
    @@struct = RecursiveOpenStruct.new(HASH)
  end
end