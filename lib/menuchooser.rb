# require 'io'

class MenuChooser
  def initialize(file)
    puts "Entering init with #{file}!"
    @targetPrice = 999
    @menuItems = parseData(file)
    # puts "Now targetPrice is #{@targetPrice}"
    @selectedItems = @menuItems
    @solved = false # greedy and nothing elses
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
      puts "This item is #{item}"
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
  def choose()
    # here we could kick off the selection algo immediately
  end

  def parseData(filePath="")
    items = []
    if File.exists? filePath
      lineNum = 0
      File.readlines(filePath).each do |line|
        # puts "#{lineNum}: #{line}"
        if lineNum == 0
          @targetPrice = dollar_to_number(line)
        else
          item = line.strip().split(",")
          # puts "Item cost is: #{item[1]}"
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
      # TODO: call a func here to trim this down to 2 digits
      dollarPrice[1, dollarPrice.length].to_f
    end
  end
end
