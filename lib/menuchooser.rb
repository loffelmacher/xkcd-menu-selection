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
    keys = @menuItems.keys()
    puts "Keys: #{keys} is of length #{keys.length}"
    for rr in (0..keys.length-1)
      puts "rr is: #{rr}"
      key = keys[rr-1]
      @selectedItems = {}
      @selectedItems[key] = @menuItems[key]
      # need to test if this solves it
      puts "Checking: #{@selectedItems} OUTER"
      for nn in (1..keys.length-1)
        key = keys[nn-1] # will repeat but to our advantage
        @selectedItems[key] = @menuItems[key]
        puts "Checking: #{@selectedItems}"
        # if scoreCombo() == @targetPrice
        #   # break
        # end
      end

      # handle the corner cases here maybe

      # if scoreCombo() == @targetPrice
      #   # break
      # end

      # additional checks will be needed here
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
