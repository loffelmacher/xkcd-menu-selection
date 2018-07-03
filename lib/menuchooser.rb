require 'money'

I18n.config.available_locales = :en # money gem wants this

class MenuChooser
  def initialize(file)
    @targetPrice = 0
    @menuItems = parseData(file)
    @selectedItems = {}
    @hasSelected = false
  end

  def selectedItems
    if not @hasSelected
      select()
    end
    @selectedItems
  end

  private
  
  def select()
    keys = @menuItems.keys()
    combo = []
    for rr in (1..keys.length)
      combo << keys.combination(rr).to_a
    end
    combo = combo.flatten(1)

    combo.each do |possibleSolution|
      total = tally(possibleSolution)
      if total == @targetPrice
        puts "WINNER WINNER CHICKEN DINNER: #{possibleSolution}"
        @selectedItems = possibleSolution
        return @selectedItems
      end
    end

    @hasSelected = true
  end

  def dollar_to_number(dollarPrice)
    Money.new(dollarPrice[1, dollarPrice.length], "USD")
  end

  def tally(solution)
    price = 0
    solution.each do |key|
      price += @menuItems[key]
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
          @targetPrice = dollar_to_number(line)
        else
          csvCells = line.strip().split(",")
          items[csvCells[0]] = dollar_to_number(csvCells[1].strip())
        end
        lineNum += 1
      end
    end
    items
  end
end
