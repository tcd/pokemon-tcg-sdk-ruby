module Pokemon
  # Image URLs
  class SetImages
    # @return [String]
    attr_accessor :logo
    # @return [String]
    attr_accessor :symbol

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      images = SetImages.new

      images.symbol = json['symbol']
      images.logo   = json['logo']

      return images
    end
  end
end
