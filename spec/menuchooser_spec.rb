require './lib/menuchooser' 

describe MenuChooser do

	it 'chooses a selection which totals $15.05' do
		subject = MenuChooser.new "/Users/randyloffelmacher/Projects/xkcd/spec/support/examples.txt"
		expect(subject.totalPrice).to eq 15.05
	end

end

