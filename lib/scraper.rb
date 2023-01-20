require "nokogiri"
require "open-uri"
require "pry"

class Scraper
    SCRAPE_URL = "http://books.toscrape.com/index.html"

    def self.scrape_genre
        doc = Nokogiri::HTML(URI.open(SCRAPE_URL))

        side_categories = doc.css(".side_categories .nav-list")
        category_elements = side_categories.css("ul li a")

        #iterate through category_elements
        category_elements.each do |category_element|
            puts category_element.text
        end

        category_elements.each_with_index do |category_element, i|
            puts "#{i + 1} #{category_element.text}"
        end


    end
end

Scraper.scrape_genre

