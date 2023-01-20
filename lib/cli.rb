class CLI
    def run
        puts "Welcome!"
        menu
    end

    def menu
        puts "Puts pick book genre"
        puts "Travel"
        puts "Mystery"
        user input = gets.chomp
        while user_input != "exit"
            # puts "Puts pick book genre"
            # puts "Travel"
            # puts "Mystery"
            user_input = gets.chomp
        end
    end
end