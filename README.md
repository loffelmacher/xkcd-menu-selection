# Xkcd Menu Ordering Problem
**To run this** you can use either `rspec` or you can run as a standalone ruby 
program with `ruby main.rb`. In both cases it uses sample data in the file 
`spec/support/examples.txt`.

Basically the knapsack problem. An NP-Complete problem. Here: http://xkcd.com/287.

The obvious way to get any one solution is to methodically list all possible 
combinations of appetizers starting with combinations of length 1. Then 
generate the combinations of length 2, and so on. It is quick to check a solution 
so this is a reasonable approach to the problem. This along with the fact that 
selecting the cheapest item 8 times would go over the target price, so we only 
stop generating possible combinations at 7.
