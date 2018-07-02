require './lib/menuchooser' 

describe MenuChooser do

	it 'chooses a selection which totals $15.05' do
		subject = MenuChooser.new "/Users/randyloffelmacher/Projects/xkcd/spec/support/examples.txt"
		# expect(subject.selectedItems).to eq [['Apples': 5], ['Bananas', 5], ['Cherries', 5.05]]
		# expect(subject.totalPrice).to eq 15.05
		expect(subject.selectedItems).to include({
			'Apples' => 5,
			'Bananas' => 5,
			'Cherries' => 5.05
		})
	end

end

