class HelloDocker::Translator
    def self.to_whale(thought)
        thought.split.map { |word | word.upcase.prepend("__ooOooOO")}.join(" ")
    end
end