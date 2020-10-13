class Startup

    attr_accessor :name, :domain 
    attr_reader :founder  

    @@all = []

    def initialize(name, founder)
        @name = name 
        @founder = founder
        @domain = domain 
        @@all << self 
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name 
        self
    end

    def funding_rounds
        FundingRound.all.select {|fund| fund.startup == self}
    end 

    def venture_capitalists
        funding_rounds.map {|fund| fund.venture_capitalist}
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.map {|fund| fund.investment}.inject(:+)
    end

    def investors
        venture_capitalists.uniq!
    end

    def big_investors
        VentureCapitalist.tres_commas_club.select {|vc| vc.startup == self}.uniq!
    end

    private

    def self.domains
        self.all.map {|startup| startup.domain}
    end

end
#has many funding rounds -
#has many venture capitalists' through funding rounds - 
