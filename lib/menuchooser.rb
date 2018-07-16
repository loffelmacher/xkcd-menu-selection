require 'money'

I18n.config.available_locales = :en # money gem wants this

class MenuChooser
  def initialize(file)
    @targetPrice = 0
    @menuItems = parseData(file)
    @selectedItems = []
    @hasSelected = false
  end

  def selectedItems
    if not @hasSelected
      select()
    end
    @selectedItems
  end

  def totalPrice
    @targetPrice
  end

  private
  
  def select()
    keys = @menuItems.keys()
    combos = []
    solved = false

    # solutions of length 1...to solutions of length 7
    for rr in (1..7) 
      sols = []
      for ss in (0..rr)
        sols << keys.repeated_combination(ss).to_a
      end

      combos << sols
    end

    combos = combos.flatten(2)
    
    combos.each do |possibleSolution|
      total = tally(possibleSolution)
      if total == @targetPrice.to_f
        puts "Choose these #{possibleSolution} to total #{@targetPrice}."
        @selectedItems = possibleSolution
        return @selectedItems
      end
    end

    if !solved 
      puts "No solution found."
    end

    @hasSelected = true
  end

  def dollar_to_number(dollarPrice)
    Money.new(dollarPrice[1, dollarPrice.length], "USD")
  end

  def tally(solution)
    price = 0
    solution.each do |key|
      item = @menuItems[key]
      if @menuItems[key]
        price += @menuItems[key].to_f
      end
    end
    price
  end

  # loads data from file, sets instance variable @targetPrice
  # returns a hash of menu items and the price for each item
  def parseData(filePath="")
    items = {}
    if File.exists? filePath
      lineNum = 0
      File.readlines(filePath).each do |line|
        if lineNum == 0
          @targetPrice = line.sub("$", "")
        else
          csvCells = line.strip().split(",")
          items[csvCells[0]] = csvCells[1].strip().sub("$", "")
        end
        lineNum += 1
      end
    end
    items
  end
end
