class CLI
    def run
        
        system('clear')
        greeting
        while menu != 'exit'
        end
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
        puts "Pick book genre"
        input = gets.chomp
        choose_option(input)

        return input
        
    end

    def list_options
        puts "1. "
        puts "2. "
    end

    def choose_option(input)
        case input 
        when "1"
            puts "Number 1 chosen"
        when "2"
            puts "Number 2 chosen"
        end
    end
end