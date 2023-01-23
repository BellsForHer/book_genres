
class Bookinfo < Genre 
    attr_accessor :book_title
    @@books = []

    def initialize(book_list) 
        @book_title = book_list

        @@books << self
    end

    #class method
    def self.all
        @@books
    end
end
    


