require './lib/menuchooser' 

describe MenuChooser do
	it 'chooses a selection which totals $15.05' do
	       expect(subject.totalPrice).to eq 15.05
	end
end










