require "nokogiri"
require "open-uri"
require "pry"
require_relative "genre.rb"
require_relative "book_info.rb"

class Scraper
    SCRAPE_URL = "http://books.toscrape.com/index.html"


    #genre.rb
    def self.scrape_genres
        puts "Scraping book genres"
        doc = Nokogiri::HTML(URI.open("http://books.toscrape.com/index.html"))

        category_genres = doc.css(".side_categories .nav-list ul li a")[0..9]
        

        #iterate through genre categories

        category_genres.each_with_index do |category_genre, i|
            puts "#{i + 1} #{category_genre.text.gsub(/[\s,]/, "")}"
            Genre.new(category_genre)
        end

        # binding.pry
    end

    #book_info.rb
    def self.scrape_books_urls
        puts "Scraping book titles by genre"
        doc = Nokogiri::HTML(URI.open("http://books.toscrape.com/index.html"))

        genre_urls = []
        book_genre_titles = []

        #iterate through genre urls

        categories_books = doc.css(".side_categories .nav-list ul li a")

        categories_books.each do |categories_book|
            g_url = categories_book.attribute('href').value
            genre_urls << g_url
        end
        

        #iterate through genre book titles

        genre_urls.each do |genre_url|
            doc = Nokogiri::HTML(URI.open("http://books.toscrape.com/#{genre_url}"))

            book_genre_titles << doc.css("section ol li h3 a")
            
            
        end

        book_genre_titles.each do |book_genre_title|
            title = book_genre_title.text
            Bookinfo.new(title)

        end
        # binding.pry

    end

    def self.scrape_information
        scrape_genres
        scrape_books_urls
    end

    
    # binding.pry


end

#terminal
#Scraper.scrape_books_urls
#Bookinfo.all[#]

#Scraper.scrape_genres
#Genre.all[0]

