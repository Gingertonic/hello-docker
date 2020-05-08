class WhaleTalk::CLI
    def initialize
        @prompt = TTY::Prompt.new
    end

    def run 
        puts "\nHello, Docker!\n"
        welcome
        app_loop
    end

    private
    def welcome 
        @name = @prompt.ask("Who do I have the pleasure of speaking with today?") { |q| q.modify :strip }
        puts "\nWelcome, #{@name}. We speak whale around here.".colorize(:light_cyan)
    end 

    def app_loop
        loop do
            instructions
            send(input_to_slug)
        end
    end 

    def instructions
        @input = @prompt.select("\nWhat would you like to do?", options)
    end

    def options
        ["Translate my thoughts", "See famous quotes in whale", "Goodbye whale"]
    end

    def input_to_slug
        @input.downcase.gsub(" ", "_")
    end

    def see_famous_quotes_in_whale
        selection = @prompt.select("\nHere are some famous quotes. Which would you like to see a translation for?", WhaleTalk::Quote.all.map(&:text)) 
        chosen_quote = WhaleTalk::Quote.find_by_text(selection)
        puts "\nThat quote is from #{chosen_quote.author} and roughly translates as:"
        puts WordWrap.ww("\t\"#{chosen_quote.translation.colorize(:light_cyan)}\"", 60)
    end

    def translate_my_thoughts
        thought = @prompt.ask("What would you like to say in whale?") { |q| q.modify :strip }
        translation = WhaleTalk::Translator.to_whale(thought)
        puts "\nOo well, in whale, you would say #{translation.colorize(:light_cyan)}"
    end

    def goodbye_whale 
        message = WhaleTalk::Translator.to_whale("Bye, #{@name}")
        puts "Bye for now! #{message.colorize(:light_cyan)}! \n"
        exit
    end
end