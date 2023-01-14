module Pokemon
  class Ability
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :text
    # @return [String]
    attr_accessor :type

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      ability = Ability.new

      ability.name = json['name']
      ability.text = json['text']
      ability.type = json['type']

      return ability
    end
  end
end
