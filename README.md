# Xkcd Menu Ordering Problem
This is a solution for not only the specific example given here https://xkcd.com/287/, but also for the general case.

Keywords: combinatorics, selection, binomial theorem, Pascal's triangle.


 all possible combos are the sum of the possible 
 combos when picking r from n where r=n, then picking r from n 
 where r=n-1, then for choosing r=n-2 from n, and so on.
 this is also a pascal triangle









  
  n! / r! * (n-r)! - number of combinations
  


For Below think of r as the "length 
of the bit string"

```
  n: 3, r=3: 1
  n: 3, r=2: 3 <-- i can get all these with product i think, and rely on hash data structure? slickest
  n: 3, r-1: 3
  n: 3, r=0: 1
  
  8 possible combos: (each is a "key" in the hash of the actual impl)
	1. ABC   
	2. AB
	3. AC
	4. BC
	5. A
	6. B
	7. C
	8. Choose None
  
  I need the SUM of that at r, r-1, r-2..r-n
```



ALL POSSIBLE COMBOS. Think of it as a string of symbols



first i build up sets of cardinality 1. using product() (and slice()?)
then i build up sets of cardinality 2
then i build up sets of cardinality 3
...


ABC
AB
AC
BA
BC
A
B
C
Choose None
































    # TODO: replace above with this, easier to read
    # @selectedItems.foreach do |outer|
    #   @selectedItems.foreach do |inner|

    #   end
    # end