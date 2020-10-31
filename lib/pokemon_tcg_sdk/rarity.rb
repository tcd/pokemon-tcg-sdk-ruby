module Pokemon
  class Rarity
    include RestClient
    
    # Get all types
    #
    # @return [Array<String>]  All types
    def self.all
      RestClient.get('rarities').body['data']
    end
  end
end