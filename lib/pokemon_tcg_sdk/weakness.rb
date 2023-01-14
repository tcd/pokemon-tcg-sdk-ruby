module Pokemon
  class Weakness
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :value

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      weakness = Weakness.new

      weakness.type  = json['type']
      weakness.value = json['value']

      return weakness
    end
  end
end
