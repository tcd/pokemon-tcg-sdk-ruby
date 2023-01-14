require 'erb'

module Pokemon
  class Card
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :supertype
    # @return [Array<String>]
    attr_accessor :subtypes
    # FIXME: not sure what type this is.
    # @return [Object]
    attr_accessor :level
    # @return [String]
    attr_accessor :hp
    # @return [Array<String>]
    attr_accessor :types
    # @return [String]
    attr_accessor :evolves_from
    # @return [Array<String>]
    attr_accessor :evolves_to
    # @return [Array<String>]
    attr_accessor :rules
    # @return [Pokemon::AncientTrait]
    attr_accessor :ancient_trait
    # @return [Array<Pokemon::Ability>]
    attr_accessor :abilities
    # @return [Array<Pokemon::Attack>]
    attr_accessor :attacks
    # @return [Array<Pokemon::Weakness>]
    attr_accessor :weaknesses
    # @return [Array<Pokemon::Resistance>]
    attr_accessor :resistances
    # @return [Array<String>]
    attr_accessor :retreat_cost
    # @return [Integer]
    attr_accessor :converted_retreat_cost
    # @return [Pokemon::Set]
    attr_accessor :set
    # @return [String]
    attr_accessor :number
    # @return [String]
    attr_accessor :artist
    # @return [String]
    attr_accessor :rarity
    # @return [Array<Integer>]
    attr_accessor :national_pokedex_numbers
    # @return [Pokemon::Legalities]
    attr_accessor :legalities
    # @return [String]
    attr_accessor :regulation_mark
    # @return [Pokemon::Tcgplayer]
    attr_accessor :tcgplayer
    # @return [Pokemon::CardImages]
    attr_accessor :images
    # @return [String]
    attr_accessor :flavor_text
    # @return [Pokemon::Cardmarket]
    attr_accessor :cardmarket

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      card = Card.new

      card.id                       = json['id']
      card.name                     = json['name']
      card.supertype                = json['supertype']
      card.subtypes                 = json['subtypes']
      card.level                    = json['level']
      card.hp                       = json['hp']
      card.types                    = json['types']
      card.evolves_from             = json['evolvesFrom']
      card.evolves_to               = json['evolvesTo']
      card.rules                    = json['rules']
      card.ancient_trait            = AncientTrait.from_json(json['ancientTrait']) unless json['ancientTrait'].nil?
      card.abilities                = json['abilities'].map { |ability_json| Ability.from_json(ability_json) } unless json['abilities'].nil?
      card.attacks                  = json['attacks'].map { |attack_json| Attack.from_json(attack_json) } unless json['attacks'].nil?
      card.weaknesses               = json['weaknesses'].map { |weakness_json| Weakness.from_json(weakness_json) } unless json['weaknesses'].nil?
      card.resistances              = json['resistances'].map { |resistance_json| Resistance.from_json(resistance_json) } unless json['resistances'].nil?
      card.retreat_cost             = json['retreatCost']
      card.converted_retreat_cost   = json['convertedRetreatCost']
      card.set                      = Set.from_json(json['set']) unless json['set'].nil?
      card.number                   = json['number']
      card.artist                   = json['artist']
      card.rarity                   = json['rarity']
      card.flavor_text              = json['flavorText']
      card.national_pokedex_numbers = json['nationalPokedexNumbers']
      card.legalities               = Legalities.from_json(json['legalities']) unless json['legalities'].nil?
      card.regulation_mark          = json['regulationMark']
      card.tcgplayer                = Tcgplayer.from_json(json['tcgplayer']) unless json['tcgplayer'].nil?
      card.cardmarket               = Cardmarket.from_json(json['cardmarket']) unless json['cardmarket'].nil?
      card.images                   = CardImages.from_json(json['images']) unless json['images'].nil?

      return card
    end

    # Get the resource string
    #
    # @return [String] The API resource string
    def self.Resource
      return "cards"
    end

    # Find a single card by the card id
    #
    # @param id [String] the card id
    # @return [Card] the Card object response
    def self.find(id)
      QueryBuilder.new(Card).find(ERB::Util.url_encode(id))
    end

    # Get all cards from a query by paging through data
    #
    # @return [Array<Card>] Array of Card objects
    def self.all
      QueryBuilder.new(Card).all
    end

    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [Array<Card>] Array of Card objects
    def self.where(args)
      QueryBuilder.new(Card).where(args)
    end
  end
end