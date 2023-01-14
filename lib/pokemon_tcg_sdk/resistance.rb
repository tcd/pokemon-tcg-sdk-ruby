module Pokemon
  class Resistance
    # @return [String]
    attr_accessor :type
    # @return [String]
    attr_accessor :value

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      resistance = Resistance.new

      resistance.type  = json['type']
      resistance.value = json['value']

      resistance
    end
  end
end
