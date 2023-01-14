module Pokemon
  class Cardmarket
    # @return [String]
    attr_accessor :url
    # @return [Pokemon::CardmarketPrices]
    attr_accessor :prices
    # @return [String]
    attr_accessor :updated_at

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      cardmarket = Cardmarket.new

      cardmarket.url        = json['url']
      cardmarket.updated_at = json['updatedAt']
      cardmarket.prices     = CardmarketPrices.from_json(json['prices']) unless json['prices'].nil?

      return cardmarket
    end
  end

  class CardmarketPrices
    # @return [Numeric]
    attr_accessor :average_sell_price
    # @return [Numeric]
    attr_accessor :low_price
    # @return [Numeric]
    attr_accessor :trend_price
    # @return [Numeric]
    attr_accessor :german_pro_low
    # @return [Numeric]
    attr_accessor :suggested_price
    # @return [Numeric]
    attr_accessor :reverse_holo_sell
    # @return [Numeric]
    attr_accessor :reverse_holo_low
    # @return [Numeric]
    attr_accessor :reverse_holo_trend
    # @return [Numeric]
    attr_accessor :low_price_ex_plus
    # @return [Numeric]
    attr_accessor :avg1
    # @return [Numeric]
    attr_accessor :avg7
    # @return [Numeric]
    attr_accessor :avg30
    # @return [Numeric]
    attr_accessor :reverse_holo_avg1
    # @return [Numeric]
    attr_accessor :reverse_holo_avg7
    # @return [Numeric]
    attr_accessor :reverse_holo_avg30

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      price = CardmarketPrices.new

      price.average_sell_price = json['averageSellPrice']
      price.low_price          = json['lowPrice']
      price.trend_price        = json['trendPrice']
      price.german_pro_low     = json['germanProLow']
      price.suggested_price    = json['suggestedPrice']
      price.reverse_holo_sell  = json['reverseHoloSell']
      price.reverse_holo_low   = json['reverseHoloLow']
      price.reverse_holo_trend = json['reverseHoloTrend']
      price.low_price_ex_plus  = json['lowPriceExPlus']
      price.avg1               = json['avg1']
      price.avg7               = json['avg7']
      price.avg30              = json['avg30']
      price.reverse_holo_avg1  = json['reverseHoloAvg1']
      price.reverse_holo_avg7  = json['reverseHoloAvg7']
      price.reverse_holo_avg30 = json['reverseHoloAvg30']

      return price
    end
  end
end
