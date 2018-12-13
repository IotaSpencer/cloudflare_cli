module CloudflareCli
  module Nodes
    def self.included(base)

      base.define_method(:name) do
        base.name
      end
    end

  end
end
