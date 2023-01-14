module Pokemon
  class AncientTrait
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :text

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      trait = AncientTrait.new

      trait.name = json['name']
      trait.text = json['text']

      return trait
    end
  end
end
