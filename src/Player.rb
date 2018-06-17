#!/usr/bin/ruy
load 'Item.rb'
load 'Request.rb'

class Player
  def initialize(i)
    @id = i
    @budget = PLAYER_BUDGET
    @items = Array.new
    @currentItem = nil
    @offeredPrice = 0
    #getRequest()

  end

  def getRequest()
    Request.new
  end
 
  def Budget
    @budget
  end

  def ItemCount
    @items.count
  end

  def SetItem(item)
    @currentItem = item
    @offeredPrice = 0
  end

  def SetRequests(r)
    @requests = r
  end

  def BiddingPrice
    @offeredPrice if @offeredPrice > 0
    @currentItem.Price
  end

  def Bidding
    shouldIBid()
  end

  def shouldIBid()
    return false if @budget < @currentItem.Price
    remaningRound = (AUCTION_COUNT - @currentItem.RoundCounter).to_f
    remainingPercentage = remaningRound/AUCTION_COUNT.to_f * 100.0 
    rand(1..90) - remainingPercentage > 0
  end
 
  def Purchase(item, price) 
    @budget -= price
    @items.push(item)
  end

  def CalculateBiddingPrice()
    return 0 if @budget < @currentItem.Price 
    p = @budget + 1
    while @budget < p 
      p = @currentItem.Price + rand(0..10)
    end
    @offeredPrice = p
    p
  end

  def Point
    p = 0
    @items.each{|i| p += i.Point}
    p
  end

  def Dump()
    s = "Player(#{@id})  Points:#{self.Point} Budget:#{@budget}"
    puts s   
  end

end
