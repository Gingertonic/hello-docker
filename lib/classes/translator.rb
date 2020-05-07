class HelloDocker::Translator
    def self.to_whale(thought)
        thought.split.map { |word | word.crypt("__ooOooOoooo__!") }.join(" ")
    end
end