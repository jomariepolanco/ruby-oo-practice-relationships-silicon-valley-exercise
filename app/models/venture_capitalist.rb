class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth
        @@all << self 
    end

    def self.all
        @@all 
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth > 1000000000}
    end

    def funding_rounds
        FundingRound.all.select {|fund| fund.venture_capitalist == self}
    end

    def startups
        funding_rounds.map {|fund| fund.startup}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def portfolio
        startups.uniq!
    end

    def biggest_investment
        funding_rounds.max {|fr1, fr2| fr1 <=> fr2}
    end

    def invested(domain)
        invest = 0 
        s_domain = startups.select {|startup| startup.domain == domain}
        fr = s_domain.map {|startup| startup.funding_rounds}
        fr.each do |fr|
            invest = fr.map {|fund| fund.investment}.inject(:+)
        end
        invest 
    end



end
#has many funding rounds -
#has many startups through funding rounds -
