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

  private
  
  def select()
    keys = @menuItems.keys()
    combo = Array.new
    puts keys.length

    # there's no good readon to go to keys.length, if you multiply any
    # of the item costs *7 they all exceed the target price
    for rr in (1..7) # for all sets of size rr 
      stuffs = []
      for ss in (0..rr)
        # puts "ss loop: #{ss}"
        stuffs << keys.repeated_combination(ss).to_a
      end

      # add an array of length rr for each of the 6 options
      # for ii in (keys)
      #   temparr = Array.new(rr,ii)
      #   # puts "Temp array all identifical #{temparr}"
      #   stuffs << temparr
      # end

      ## NOW generate the 6 arrays of length rr for each of our n items
      combo << stuffs
    end
    # puts "Combo here: #{combo}"
    # puts ""
    # puts ""

    # combo = combo.flatten(1)

    # puts "Combo NOW: #{combo}"
    # puts ""
    # puts ""


    combo = combo.flatten(2)

    # puts "Combo NOW: #{combo}"
    # puts ""
    # puts ""


    # puts "Combo here: #{combo}"
    
    combo.each do |possibleSolution|
      total = tally(possibleSolution)
      if possibleSolution.length() == 4
        # puts "Sol here: #{possibleSolution} Total is: #{total}"
      end
      if total == @targetPrice.to_f
        # puts "YOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
        puts "Choose these #{possibleSolution} to hit target price #{@targetPrice}"
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
    # puts "Entering tally() solution is: #{solution}"
    # puts ""
    price = 0
    solution.each do |key|
      item = @menuItems[key]
      # puts "Menu items is: #{@menuItems}, Key: #{key}, Item: #{item}"
      # puts "Key: #{key}, Item: #{item}"

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
          # @targetPrice = dollar_to_number(line)
          @targetPrice = line
        else
          csvCells = line.strip().split(",")
          # items[csvCells[0]] = dollar_to_number(csvCells[1].strip())
          items[csvCells[0]] = csvCells[1].strip()
        end
        lineNum += 1
      end
    end
    items
  end
end

# def main()
#   puts "Hello there!!!"
#   # spec/support/examples.txt
# end