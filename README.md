# Xkcd Menu Ordering Problem
This is a solution for not only the specific example given here https://xkcd.com/287/, but also for the general case.

Keywords: combinatorics, selection, binomial theorem, Pascal's triangle.


  
  n! / r! * (n-r)! - number of combinations
  
  n: 3, r=3: 1
  n: 3, r=2: 3
  n: 3, r-1: 3
  n: 3, r=0: 1
  
  8 possible solutions
  
  I need the SUM of that at r, r-1, r-2..r-n


ALL POSSIBLE COMBOS. Think of it as a string of symbols

1. ABC
2. AB
3. AC
4. BC
5. A
6. B
7. C
8. Choose None


    # TODO: replace above with this, easier to read
    # @selectedItems.foreach do |outer|
    #   @selectedItems.foreach do |inner|

    #   end
    # end