require './lib/menuchooser' 

module Helpers
	# def rollMany(game, times, pins)
	# 	for ii in (0...times)
	# 		game.roll(pins)
	# 	end
	# end
end

RSpec.configure do |c|
  c.include Helpers
end

describe MenuChooser do
	# include_examples "some example", "parameter1"

	before :each do
	  @chooser = MenuChooser.new
	end

	it 'chooses apples, bananas, and cherries on its first choice' do
		# rollMany(@chooser, 20, 0)
		expect(@chooser.choose()).to eq ['Apples', 'Bananas', 'Cherries']
		# expect(@chooser.choose().totalPrice).to eq 15.05
	end
end










