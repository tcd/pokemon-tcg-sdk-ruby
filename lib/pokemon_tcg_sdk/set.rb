module Pokemon
  class Set
    # @return [String]
    attr_accessor :id
    # @return [String]
    attr_accessor :name
    # @return [String]
    attr_accessor :series
    # @return [Integer]
    attr_accessor :printed_total
    # @return [Integer]
    attr_accessor :total
    # @return [Pokemon::Legalities]
    attr_accessor :legalities
    # @return [String]
    attr_accessor :ptcgo_code
    # @return [String]
    attr_accessor :release_date
    # @return [String]
    attr_accessor :updated_at
    # @return [Pokemon::SetImages]
    attr_accessor :images

    # @param json [Hash]
    # @return [self]
    def self.from_json(json)
      set = Set.new

      set.id            = json['id']
      set.name          = json['name']
      set.series        = json['series']
      set.printed_total = json['printedTotal']
      set.total         = json['total']
      set.legalities    = Legalities.from_json(json['legalities']) unless json['legalities'].nil?
      set.ptcgo_code    = json['ptcgoCode']
      set.release_date  = json['releaseDate']
      set.updated_at    = json['updatedAt']
      set.images        = SetImages.from_json(json['images']) unless json['images'].nil?

      return set
    end

    # Get the resource string
    #
    # @return [String] The API resource string
    def self.Resource
      return "sets"
    end

    # Find a single set by the set code
    #
    # @param id [String] the set code
    # @return [Set] the Set object response
    def self.find(id)
      QueryBuilder.new(Set).find(id)
    end

    # Get all sets from a query by paging through data
    #
    # @return [Array<Set>] Array of Set objects
    def self.all
      QueryBuilder.new(Set).all
    end

    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [Array<Set>] Array of Set objects
    def self.where(args)
      QueryBuilder.new(Set).where(args)
    end
  end
end