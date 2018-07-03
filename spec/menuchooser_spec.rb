require './lib/menuchooser' 

describe MenuChooser do

	it 'chooses a selection which totals $15.05' do
		subject = MenuChooser.new "spec/support/examples.txt"

		expect(subject.selectedItems).to contain_exactly(
			'mixed fruit',
			'french fries',
			'hot wings',
			'sampler plate'
		)
	end

end

