require 'csv'

class MenuChooser
  def initialize()
    @targetPrice = 15.05
    @menuItems = [['Apple', 5], ['Banana', 5], ['Cherry', 5.05]]
    @selectedItems = @menuItems
    @solved
  end

  def choose()
    # here we could kick off the selection algo immediately
  end

  def selectedItems
    items = []
    # @selectedItems.each |item|
    #   items.push(item[0])
    # end
    items
  end

  def totalPrice
    price = 0
    @selectedItems.each do |item|
      # puts "This item is #{item}"
      price += item[1]
    end
    price
  end

  private

#
# n! / r! * (n-r)! - number of combinations
#
# 6! / r! * (6 - r)! # 720 different ways to choose
#

#
#
#
  # Ruby will store each table row as an array, 
  # with each cell being a string element of the array.
#
#
#
  # def parseData(filePath)
  #   CSV.read('customers.csv')
  # end
end
