# Xkcd Menu Ordering Problem
Basically the knapsack problem. NP-Complete.

The most straightforward way for a human to find a solution is to methodically start by first listing all the (6) ways of choosing one appetizer, and their total costs, then list all the (21) ways of choosing two appetizers (allowing repeats), and then list all the (56) ways of choosing three appetizers, and so forth. As any combination of eight appetizers would be more than $15.05, the process need not extend beyond listing all the (1715) ways of choosing seven appetizers.




  
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































