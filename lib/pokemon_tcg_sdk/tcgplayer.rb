module Pokemon
  class Tcgplayer
    # @return [String]
    attr_accessor :url
    # @return [Pokemon::TcgPlayerPrices]
    attr_accessor :prices
    # @return [String]
    attr_accessor :updated_at

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      tcgplayer = Tcgplayer.new

      tcgplayer.url        = json['url']
      tcgplayer.updated_at = json['updatedAt']
      tcgplayer.prices     = TcgPlayerPrices.from_json(json['prices']) unless json['prices'].nil?

      return tcgplayer
    end
  end

  class TcgPlayerPrices
    # @return [Pokemon::TcgPlayerPriceValues]
    attr_accessor :normal
    # @return [Pokemon::TcgPlayerPriceValues]
    attr_accessor :holofoil
    # @return [Pokemon::TcgPlayerPriceValues]
    attr_accessor :reverse_holofoil
    # @return [Pokemon::TcgPlayerPriceValues]
    attr_accessor :first_edition_holofoil
    # @return [Pokemon::TcgPlayerPriceValues]
    attr_accessor :first_edition_normal
    # @return [Pokemon::TcgPlayerPriceValues]
    attr_accessor :first_edition
    # @return [Pokemon::TcgPlayerPriceValues]
    attr_accessor :unlimited

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      price = TcgPlayerPrices.new

      price.normal                 = TcgPlayerPriceValues.from_json(json['normal']) if json.key?('normal')
      price.holofoil               = TcgPlayerPriceValues.from_json(json['holofoil']) unless json['holofoil'].nil?
      price.reverse_holofoil       = TcgPlayerPriceValues.from_json(json['reverseHolofoil']) unless json['reverseHolofoil'].nil?
      price.first_edition_holofoil = TcgPlayerPriceValues.from_json(json['1stEditionHolofoil']) unless json['1stEditionHolofoil'].nil?
      price.first_edition_normal   = TcgPlayerPriceValues.from_json(json['1stEditionNormal']) unless json['1stEditionNormal'].nil?
      price.first_edition          = TcgPlayerPriceValues.from_json(json['1stEdition']) unless json['1stEdition'].nil?
      price.unlimited              = TcgPlayerPriceValues.from_json(json['unlimited']) unless json['unlimited'].nil?

      return price
    end
  end

  class TcgPlayerPriceValues
    # @return [Numeric]
    attr_accessor :low
    # @return [Numeric]
    attr_accessor :mid
    # @return [Numeric]
    attr_accessor :high
    # @return [Numeric]
    attr_accessor :market
    # @return [Numeric]
    attr_accessor :direct

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      values = TcgPlayerPriceValues.new

      values.low    = json['low']
      values.mid    = json['mid']
      values.high   = json['high']
      values.market = json['market']
      values.direct = json['direct']

      return values
    end
  end
end
