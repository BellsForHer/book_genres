require "nokogiri"
require "open-uri"
require "pry"
require_relative "genre.rb"
require_relative "book_info.rb"

class Scraper
    SCRAPE_URL = "http://books.toscrape.com/index.html"

    def self.scrape_genres
        doc = Nokogiri::HTML(URI.open("http://books.toscrape.com/index.html"))

        category_genres = doc.css(".side_categories .nav-list ul li a")
        

        #iterate through genre categories

        category_genres.each_with_index do |category_genre, i|
            puts "#{i + 1} #{category_genre.text.gsub(/[\s,]/, "")}"
        end

        # #iterate through genre urls


        # category_genres.each do |category_genre|
        #     g_url = category_genre.attribute('href').value
        #     genre_urls << g_url
        # end

        Genre.new(category_genres)

        
    end

    def self.scrape_books_urls
        puts "Scraping Genre Book titles"
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

        
        
    end

    def self.scrape_titles(book_genre_titles)
        book_genre_titles.each do |book_genre_title|
            title = book_genre_title.text

            Bookinfo.new(title)

            binding.pry
        end
    end

    binding.pry


end


