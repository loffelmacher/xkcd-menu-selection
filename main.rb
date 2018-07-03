require './lib/menuchooser'

chooser = MenuChooser.new "data.txt"

items = chooser.selectedItems

if items.length > 0 
	puts "Choose: #{items}"
else
	puts "No solution found!"
end