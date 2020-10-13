require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("amazon", "jeff")
s2 = Startup.new("facebook", "mark")
s3 = Startup.new("myspace", "tom")
s4= Startup.new("tidal", "jayz")

v1 = VentureCapitalist.new("tank", 1000000)
v3 = VentureCapitalist.new("char", 4500000)
v4 = VentureCapitalist.new("git", 20000000)
v2 = VentureCapitalist.new("bank", 45000000)
v5 = VentureCapitalist.new("sf", 1000000000)

f1 = FundingRound.new(s1, v1, "Angel", 10000.23)
f2 = FundingRound.new(s2, v2, "Pre-Seed", 1000000.05)
f3 = FundingRound.new(s3, v3, "Seed", 15000.60)
f4 = FundingRound.new(s4, v4, "Series A", 14000.00)
f5 = FundingRound.new(s1, v5, "Series B", 20000.63)
f6 = FundingRound.new(s3, v4, "Series C", 15223.56)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line