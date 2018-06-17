#!/usr/bin/ruby
class Deck
  	def initialize()
		@deck = Array.new
  	end

	def Add(card)
		@deck << card
	end

	def Shuffle()
		@deck.shuffle!
	end 

	def Draw()
		@deck.pop
	end

	def Dump()
		str = ""
		@deck.each { |c| str = str + "#{c.Dump()}"}
		puts str
	end
end

