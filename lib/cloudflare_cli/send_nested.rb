class String
  alias_method :starts_with?, :start_with?
  alias_method :ends_with?, :end_with?
end
class Object
  # Retrieve the value of a deeply nested attribute
  #
  # Example usage
  #
  #   attribute = "data.foo['bar'].id"
  #   value = obj.send_nested(attribute)
  #
  # Under the hood this will do something akin to
  #   obj.send(data).send(foo)['bar'].send(id)
  #
  # This also works with symbols in the attribute string
  #
  #   attribute = "data.foo[:bar].id"
  #   value = obj.send_nested(attribute)
  #
  # Under the hood this will do something akin to
  #   obj.send(data).send(foo)['bar'].send(id)
  #
  #
  # Parameters
  #   attribute:  The (nested) attribute to query for
  #   with_indifferent_access: If this is true, then this will convert any
  #                            hashes to HashWithIndifferentAccess. As such,
  #                            anything that was a symbol before will become a
  #                            string.
  # Returns whatever the attribute evaluates to with the major caveat is that
  # if `with_indifferent_access` is used, any resulting hashes will have string
  # keys even if they were symbols to begin with as this is how the ruby method
  # hash.with_indifferent_access works
  def send_nested(attribute, with_indifferent_access: false)
    # Split in to the attribute and the deeper nested things
    # E.g. this will split "data.foo['bar'].id" in to
    #   data
    #   .foo['bar'].id

      matches = /([^\.\[\]]+)(.*)/.match(attribute)
      attr = matches.captures[0]
      obj = send(attr)
      until matches.captures[1].empty?
        next_part = matches.captures[1]
        kind = next_part.slice!(0)

      # This means to use a nested send
      if kind == '.'
        matches = /([^\.\[\]]+)(.*)/.match(next_part)
        attr = matches.captures[0]
        obj = obj.send(attr)

      # This means we want to access something by a key or index
      elsif kind == '['
        matches = /(['|"|:]*[^\]]+['|"]*)\](.*)/.match(next_part)
        attr = matches.captures[0]

        # Figure out if the attribute is a string, symbol, or an integer index
        # and do the right thing to convert it to the attribute we care about
        if attr.starts_with?(':')
          attr.slice!(0)
          attr = attr.to_sym
        elsif attr.starts_with?("'")
          unless attr.ends_with?("'")
            raise ArgumentError, "Hash key starts with a ' but does not end with one: #{attr}"
          end
          attr.slice!(0)
          attr.chop!
        elsif attr.starts_with?('"')
          unless attr.ends_with?('"')
            raise ArgumentError, "Hash key starts with a \" but does not end with one: #{attr}"
          end
          attr.slice!(0)
          attr.chop!
        elsif attr.to_i.to_s == attr
          attr = attr.to_i
        end

        if with_indifferent_access && obj.is_a?(Hash)
          obj = obj.with_indifferent_access
        end

        obj = obj[attr]

      else
        raise ArgumentError, "Could not parse attribute #{attribute}"
      end
    end
    obj
  end
end
