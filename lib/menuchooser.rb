# require 'io'

class MenuChooser
  def initialize(file)
    @targetPrice = 0
    @menuItems = parseData(file)
    puts "target price: #{@targetPrice}"
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
      puts "item: #{item}"
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
  def select()
    # here we could kick off the selection algo immediately
    @selectedItems = @menuItems
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
