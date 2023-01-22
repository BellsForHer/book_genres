class Genre
    attr_accessor :category
    @@genres = []

    def initialize(genre_category) 
        @category = genre_category

        @@genres << self
    end

    #class method
    def self.all
        @@genres
    end
end

