# require 'io'

class MenuChooser
  def initialize(file)
    @targetPrice = 0
    @menuItems = parseData(file)
    # puts "target price: #{@targetPrice}"
    @selectedItems = []
    @hasSelected = false
  end

  def selectedItems
    # if not @hasSelected and @targetPrice
    if not @hasSelected 
      select()
    end
    @selectedItems
  end

  def totalPrice
    if not @hasSelected 
      select()
    end

    price = 0
    @selectedItems.each do |item|
      # puts "item: #{item}"
      price += item[1]
    end
    price
  end

  private

  #
  # n! / r! * (n-r)! - number of combinations
  #
  # n: 3, r=3: 1
  # n: 3, r=2: 3
  # n: 3, r-1: 3
  # n: 3, r=0: 1
  #
  # 8 possible solutions
  #
  # I need the SUM of that at r, r-1, r-2..r-n
#
#
# ALL POSSIBLE COMBOS. Think of it as a string of symbols
#
# 1. ABC
# 2. AB
# 3. AC
# 4. BC
# 5. A
# 6. B
# 7. C
# 8. Choose None
#
  def select()
    # here we could kick off the selection algo immediately
    @selectedItems = @menuItems

    # loop through r, descending (so i get the most items)
    for rr in (@selectedItems.length...0)
      
      for nn in (0...@selectedItems.length)

      end
    end

    # @selectedItems.foreach do |outer|
    #   @selectedItems.foreach do |inner|

    #   end
    # end


    @hasSelected = true
  end

  def parseData(filePath="")
    items = []
    if File.exists? filePath
      lineNum = 0
      File.readlines(filePath).each do |line|
        if lineNum == 0
          @targetPrice = dollar_to_number(line)
        else
          item = line.strip().split(",")
          items.push([
            item[0], 
            dollar_to_number(item[1])
          ])
        end
        lineNum += 1
      end
    end
    items
  end

  def dollar_to_number(dollarPrice)
    if dollarPrice
      dollarPrice[1, dollarPrice.length].to_f
    end
  end
end
