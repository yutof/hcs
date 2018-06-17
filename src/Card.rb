#!/usr/bin/ruby
class Card
  	def initialize(val)
		@value = val
  	end

  	def GetValue()
  		@value
  	end

	def Dump()
		puts "Value is #{@value}"
	end
end

