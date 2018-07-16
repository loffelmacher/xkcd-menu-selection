require './lib/menuchooser'

chooser = MenuChooser.new "spec/support/examples.txt"

items = chooser.selectedItems
