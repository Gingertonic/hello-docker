class HelloDocker::Quote
    attr_accessor :id, :author, :text
    @@all = []

    def initialize(attrs)
        attrs.each{ |k, v| send("#{k}=", v)}
        @@all.append(self)
    end 

    def self.import
        data = CSV.read("lib/data/quotes.csv", headers: true)
        data.each{|row| new(row.to_hash)}
    end 

    def self.all
        import if @@all.empty?
        @@all
    end
end