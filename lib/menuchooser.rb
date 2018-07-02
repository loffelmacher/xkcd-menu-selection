# require 'io'

class MenuChooser
  def initialize(file)
    @targetPrice = 0
    @menuItems = parseData(file)
    # puts "target price: #{@targetPrice}"
    # puts "Menu items: #{@menuItems}"
    @selectedItems = {}
    @hasSelected = false # TODO: add ? to end of this property name. problem is b/c this has a getter
  end

  def selectedItems
    if not @hasSelected # TODO: add `and @targetPrice`
      select()
    end
    @selectedItems
  end

  def totalPrice
    # TODO: put in an ensure/rescue here
    scoreCombo()
  end

  private

  def select()
    # puts "Entering select()"
    # try all combos that include 1 item
    # then all with 2 items
    # then all with 3 items
    # and so on...
    puts "The length of menuItems is: #{@menuItems.length()}"
    for rr in (1...@menuItems.length)
      @selectedItems = {}
      for nn in (1...@menuItems.length)
        # if we pick only from the set allowed 
        # by the items in the outer loop
        # that will close up this logic


        # check if it's already in there, otherwise push
        # @selectedItems.push(@menuItems[n-1])
        puts "The item at #{nn-1} is: #{@menuItems.keys()[nn-1]}"
        # puts "The key here is: #{@menuItems[nn-1].key()}"
        key = @menuItems.keys()[nn-1]
        @selectedItems[key] = @menuItems[key]
      end

      puts "Checking price for: #{@selectedItems}"

      # additional checks will be needed here
      if scoreCombo() == @targetPrice
        break
      end
    end
    @hasSelected = true
  end

  def parseData(filePath="")
    items = {}
    if File.exists? filePath
      lineNum = 0
      File.readlines(filePath).each do |line| # TODO; a bit ugly, refactor
        if lineNum == 0
          @targetPrice = dollar_to_number(line)
        else
          line = line.strip().split(",")
          # s
          items[line[0]] = dollar_to_number(line[1])
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

  def scoreCombo()
    price = 0
    @selectedItems.each do |key,val|
      # puts "item: #{item}"
      if !val.nil? 
        price += val
      end
    end
    price    
  end
end
