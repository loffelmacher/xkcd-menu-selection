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
    
  # Big O n^2 + 1 total combos, BEFORE eliminating duplicate sets
  def select()
    keys = @menuItems.keys()
    combo = []
    # generate all combinations of length rr
    for rr in (1..keys.length) # build up a set
      combo << keys.combination(rr).to_a
    end
    combo = combo.flatten(1)

    # puts "Combo [#{combo.length}]: #{combo}"

    combo.each do |possibleSolution|
      puts "Solution: #{possibleSolution}"
      ss = scoreCombo2(possibleSolution)
      if ss == @targetPrice
        puts "WINNER WINNER CHICKEN DINNER"
        @selectedItems = possibleSolution
        return @selectedItems
      end
    end

    @hasSelected = true
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

  def scoreCombo2(solution)
    price = 0
    solution.each do |key|
      # puts "key: #{key}"
      price += @menuItems[key]
    end
    price    
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
end
