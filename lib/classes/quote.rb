class WhaleTalk::Quote
    attr_accessor :id, :author, :text
    @@all = []

    def initialize(attrs)
        attrs.each{ |k, v| send("#{k}=", v)}
        @@all.append(self)
    end 

    def translation
        @translation ||= WhaleTalk::Translator.to_whale(text)
    end

    def self.all
        import if @@all.empty?
        @@all
    end

    def self.find_by_text(selection)
        all.find{|q| q.text === selection}
    end

    private
    def self.import
        data = CSV.read("lib/data/quotes.csv", headers: true)
        data.each{|row| new(row.to_hash)}
    end 
end