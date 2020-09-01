class VentureCapitalist
    @@all = [] 
    attr_reader :name
    attr_accessor :total_worth

    def initialize (name, total_worth)
        @name = name
        @total_worth = total_worth

        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth > 1000000000}
    end 

    def offer_contract (startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select {|r| r.venture_capitalist == self}
    end 

    def portfolio
        funding_rounds.map {|r| r.startup}.uniq
    end 

    def biggest_investment
        
        self.funding_rounds.max do |r_a, r_b| 
            r_a.investment <=> r_b.investment
            #binding.pry
        end
    end 
    
    def invested(domain)
        arr = self.funding_rounds.select {|r| r.startup.domain == domain}
        arr.sum {|d| d.investment}
    end
end