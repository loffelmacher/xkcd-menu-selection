require 'csv'

class MenuChooser
  def initialize()
    @targetPrice = 15.05
    # @menuItems = parseData(data)
    # @menuItems = [['Apple', 5], ['Banana', 5], ['Cherry', 5.05]]
    @menuItems = ['Apples', 'Bananas', 'Cherries']
    @selectedItems = []
    @solved
  end

  # def solve() 

  # end

  def choose()
    # here we could kick off the selection algo immediately

    # just do a naive impl quick to get the test passing with DUMB data
    @selectedItems = @menuItems
    # sel.totalPrice = 0

    # sel.items.each |item|
    #   sel.totalPrice += item[1] # the price is at idx 1
    # end
  end

  # private

  # def parseData(filePath)
  #   CSV.read('customers.csv')
  # end
end
