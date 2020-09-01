require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("Pied Piper", "Richard", "PiedPiper.com")

vc1 = VentureCapitalist.new("Russ H.", 1000000001)
vc2 = VentureCapitalist.new("Erlich", 1000)

fr1 = FundingRound.new(s1, vc2, "Angel", 1000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line