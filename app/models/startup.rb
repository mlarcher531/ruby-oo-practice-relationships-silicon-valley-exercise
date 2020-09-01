class Startup
    @@all = []
    attr_accessor :name, :domain
    attr_reader :founder

    def initialize (name, founder, domain)
        @name = name
        @founder = founder 
        @domain = domain

        self.class.all << self
    end 

    def self.all
        @@all
    end 

    def pivot (name, domain)
        @name = name
        @domain = domain
    end 

    def self.find_by_founder (founder)
        self.all.find {|s| s.founder == founder}
    end 

    def self.domains
        self.all.map {|s| s.domain}
    end 

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def all_rounds
        FundingRound.all.select {|r| r.startup == self}
    end 

    def funding_rounds
        all_rounds.count
    end 

    def total_funds
        all_rounds.sum {|r| r.investment}
    end 

    def investors
        all_rounds.map {|r| r.venture_capitalist}.uniq
        #all_rounds.map {|r| r.venture_capitalist.name}.uniq
        #if you only want the names
    end

    def big_investors 
        self.investors.select {|i| i.total_worth > 1000000000}.uniq 
    end 

end
