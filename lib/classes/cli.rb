class HelloDocker::CLI
    def initialize
        @prompt = TTY::Prompt.new
    end

    def run 
        puts 'Hello, Docker!'
        puts "We speak whale around here."
        app_loop
    end

    private
    def app_loop
        loop do
            instructions
            send(input_to_slug)
        end
    end 

    def instructions
        @input = @prompt.select("What would you like to do?", options)
    end

    def options
        ["Translate my thoughts", "See famous quotes in whale", "Goodbye whale"]
    end

    def input_to_slug
        @input.downcase.gsub(" ", "_")
    end

    def see_famous_quotes_in_whale
        puts "Here are some famous quotes. Which would you like to see a translation for?"
    end

    def translate_my_thoughts
        thought = @prompt.ask("What would you like to say in whale?") { |q| q.modify :strip }
        puts thought
    end

    def goodbye_whale 
        puts "Bye for now! Ooooaaahhhhh!"
        exit
    end
end