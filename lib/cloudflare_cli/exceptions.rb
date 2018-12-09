require 'gli'

module CloudflareCli
  class APIError < GLI::CustomExit
    attr_reader :endpoint
    def initialize(endpoint, message, exit_code)
      @endpoint = endpoint
      message = "Unable to request from '#{endpoint}', due to #{message}"
      super(message, exit_code)

    end
  end
  class FlagSwitchConflictError < GLI::CustomExit
    attr_reader :given_option, :conflicts_with
    def initialize(given_option, conflicts_with)
      @given_option = given_option
      @conflicts_with = conflicts_with

      _s = "Option '#{@given_option}' conflicts with '#{@conflicts_with}', they can not be used together"
      super(_s, -1)
    end
  end
  class FlagSwitchDependencyError < GLI::CustomExit
    attr_reader :given_option, :depends_on
    def initialize(given_option, depends_on)
      @given_option = given_option
      @depends_on = depends_on
      _s = "Option '#{@given_option}' depends on '#{@depends_on}', they must be used together"


      super(_s,1)
    end
  end
end