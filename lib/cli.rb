class CLI
    def run
        greeting
        while menu != 'exit'
        end
        Scraper.scrape_information
        system('clear')      
        end_program
    end

    def greeting
        puts "Welcome to books genre mania!"
    end

    def end_program
        puts "Come again soon!"
    end

    def menu
        #list of options
        list_options
        #get user input
        puts "Pick a book genre"
        input = gets.chomp
        choose_option(input)

        return input
        
    end

    def list_options
        Scraper.scrape_genres
    end

    def choose_option(input)
        case input 
        when "1"
            puts "Number 1 chosen"
            puts Bookinfo.all[0].book_title
        when "2"
            puts "Number 2 chosen"
        end
    end
end