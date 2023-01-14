module Pokemon
  class CardImages
    # @return [String]
    attr_accessor :small
    # @return [String]
    attr_accessor :large

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      images = CardImages.new

      images.small = json['small']
      images.large = json['large']

      return images
    end
  end
end
