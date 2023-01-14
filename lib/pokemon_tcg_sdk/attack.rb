module Pokemon
  class Attack
    # @return [Array<String>]
    attr_accessor :cost
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :text
    # @return [String]
    attr_accessor :damage
    # @return [Integer]
    attr_accessor :converted_energy_cost

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      attack = Attack.new

      attack.cost = json['cost']
      attack.name = json['name']
      attack.text = json['text']
      attack.damage = json['damage']
      attack.converted_energy_cost = json['convertedEnergyCost']

      return attack
    end
  end
end
