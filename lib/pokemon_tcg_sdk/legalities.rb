module Pokemon
  class Legalities
    # @return [String]
    attr_accessor :expanded
    # @return [String]
    attr_accessor :standard
    # @return [String]
    attr_accessor :unlimited

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      legality = Legalities.new

      legality.expanded  = json['expanded']
      legality.standard  = json['standard']
      legality.unlimited = json['unlimited']

      return legality
    end
  end
end
