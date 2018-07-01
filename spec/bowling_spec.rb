require './lib/game' 

module Helpers
	def rollMany(game, times, pins)
		for ii in (0...times)
			game.roll(pins)
		end
	end

	def rollSpare(game)
		game.roll(5)
		game.roll(5)
	end

	def rollStrike(game)
		game.roll(10)
	end
end

RSpec.configure do |c|
  c.include Helpers
end

describe Game do
	before :each do
	  @game = Game.new
	end

	it 'scores 0 if all gutter balls' do
		rollMany(@game, 20, 0)
		expect(@game.score()).to eq 0
	end

	it 'scores 20 if all ones' do 
		rollMany(@game, 20, 1)
		expect(@game.score()).to eq 20
	end

	it 'scores 16 if one spare' do 
		rollSpare(@game)
		@game.roll(3)
		rollMany(@game, 17, 0)
		expect(@game.score()).to eq 16
	end

	it 'scores 24 if one strike' do 
		rollStrike(@game)
		@game.roll(3)
		@game.roll(4)
		rollMany(@game, 16, 0)
		expect(@game.score()).to eq 24
	end	

	it 'scores 300 if perfect game' do 
		rollMany(@game, 12, 10)
		expect(@game.score()).to eq 300
	end	

end

