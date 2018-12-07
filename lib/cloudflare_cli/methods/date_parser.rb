require 'date'
require 'active_support/time_with_zone'
module CloudflareCli
  module Methods
    class DateParser
      def initialize(_time = Time.now)
        return DateTime.parse(_time).to_time.to_s

      end
      def self.parse(time = nil)
        return self.new(time)
      end
    end
  end
end