#!/usr/bin/ruby
load 'Config.rb'
load 'Deck.rb'
load 'Card.rb'
#constants begin
MIN_NUM=0
MAX_NUM=7
#constants end


@Deck = Deck.new()

def puts(o)
  if PRINT_ENABLED
    super(o)
  end 
end

=begin
	
rescue Exception => e
	
end
@DieResultDictionary = Hash.new()

def ThrowDieForNTimes(n)
	total = 0.0
	for i in 0..n
		r = rand(MIN_NUM..MAX_NUM)
		@DieResultDictionary[r] = @DieResultDictionary[r] == nil ? 1 : @DieResultDictionary[r] + 1 
		total += r
	end
	puts "avr is #{total/n}"
end

def Simulate()
  for i in 1..10
    puts rand(0..7)
  end
end

def PrintThrowDiceResult()
	@DieResultDictionary.each {|key, value| puts "#{key} is #{value}" }
end

=end

def ConstructDeck()
	DECK_CONFIG.each {|key, value| 
		for i in 0..value
			@Deck.Add(Card.new(key))
		end
	}
end



start = Time.now
puts "Start the game!"
ConstructDeck()
@Deck.Shuffle()
@Deck.Dump()

finish = Time.now
diff = finish - start
puts "Ended. Took #{diff}"



=begin
@totalRound = 0
@totalAuctionCount = 0
@totalRemainingBudget = 0.0
@totalWinnerPoint = 0
@totalWinnerItemRatio = 0.0
@totalWinnerItemCount = 0
@lastItemDict = Hash.new
def PlayGame()
  am = AuctionManager. new
  pl = CreatePlayers()
  SetRequests(pl)
  am.SetPlayers(pl)
  while am.isGameEnded == false
    am.Proceed()
  end
  #am.PrintResult()
  UpdateReportVariables(am)
end

def UpdateReportVariables(am)
  @totalRound += am.Round
  @totalAuctionCount += am.AuctionCount
  @totalRemainingBudget += am.AverageRemainingBudget
  @totalWinnerPoint += am.WinnerPoint
  @totalWinnerItemRatio += am.WinnersPurchaseRatio
  @totalWinnerItemCount += am.WinnerItemCount
  AddLastItem(am)
end

def AddLastItem(am)
  k = am.LastItemKey
  if @lastItemDict[k] != nil
    @lastItemDict[k] += 1
  else
    @lastItemDict[k] = 1
  end
end

def GetLastItemRatioStr()
  s = ""
  @lastItemDict.each do |k,v|
    s +="\n#{k} Ratio:#{v.to_f/TEST_GAME_COUNT.to_f}" 
  end
  s
end

def MakeRequests()
  rl = Array.new
  rg = RequestGenerator.new
  for i in 1..REQUEST_NUM
    rl.push(rg.Generate())
    #ps.push(Player.new(i))
  end
  rl  
end

def SetRequests(pl)
  pl.each {|p| p.SetRequests(MakeRequests())}
end

def CreatePlayers()
  ps = Array.new
  for i in 1..PLAYER_NUM
    ps.push(Player.new(i))
  end
  ps
end

def PrintResult()
  tgc_f = TEST_GAME_COUNT.to_f
  s = "Round #{@totalRound}  Average:#{@totalRound.to_f/tgc_f}"
  s += "\nAuction #{@totalAuctionCount.to_f}  Average:#{@totalAuctionCount.to_f/tgc_f}"
  s += "\nBudget Average:#{@totalRemainingBudget/tgc_f}"
  s += "\nWinner Point Average:#{@totalWinnerPoint.to_f/tgc_f}"
  s += "\nWinner Item Count Average:#{@totalWinnerItemCount.to_f/tgc_f}"
  s += "\nWinner Item Ratio Average:#{@totalWinnerItemRatio.to_f/tgc_f}"
  s += "\n#{GetLastItemRatioStr()}"
  puts s
end 

start = Time.now
puts "Start the game! Count #{AUCTION_COUNT}"
for i in 1..TEST_GAME_COUNT
  PlayGame()
end

finish = Time.now
diff = finish - start
puts "Ended. Took #{diff}"

PrintResult()
=end




