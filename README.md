Contains category wise problems(data structures, competitive) of popular platforms. 

## Tags
- [Prefix Sums](#prefix-sum--cumulative-sum)
- [Dynamic Programming](#dynamic-programming)
    - [knapsack type](#knapsack-type)
    - [Coin Change type](#coin-change-type)
    - [Grid path type](#grid-path-types)
    - [LIS type](#lis-type)
- [Graphs](#graphs)
  - [Topological sorting](#topological-sorting)
  - [Djikstra](#djikstra)
  - [flood fill](#flood-fill)
  - [DFS](#DFS)
  - [BFS](#BFS)
  - [01 BFS](#01-bfs)
  - [MSSP](#MSSP)
  - [MST](#MST)
- [NT](#Number-theory)
- [Data structure](#Data-structure)
  - [Stack](#Stack)
  - [DSU](#DSU)
- [Adhoc, observation type](#adhoc-observation-type)

## Prefix Sum / Cumulative sum.
- [blackboard-gcd](/Atcoder/prefix_sums/blackboard_gcd.md)
- [make_power_of_2](/Codeforces/prefix_sums/make_power_of_two.md)
- [Subsequence summing to 7](/USACO/prefix_sums/subs_summing_to_sevens.md)
 
## Dynamic Programming. 

### Knapsack type
- [two_sets2](/CSES/dp/two_sets2.md)
- [book_shop](/CSES/dp/book_shop.md)
- [money_sums](/CSES/dp/money_sums.md)
- [dividing_coins](/uva/dp/dividing_coins.md)
- [divisible_group_sums](/uva/dp/divisible_group_sums.md)
- [wedding_shopping](/uva/dp/wedding_shopping.md)
- [sum_of_different_primes](/uva/dp/sum_of_different_primes.md)
- [hoof_paper_scissor](/USACO/dp/hoof_paper_scissor.md)
 
### Coin change type
- [removing_digits](/CSES/dp/removing_digits.md)
- [dollars](/uva/dp/dollars.md)
- [fruit_feast](/USACO/dp/fruit_feast.md)
 
### Grid path types
- [edit_distance](/CSES/dp/book_shop.md)
- [grid_paths](/CSES/dp/grid_paths.md)
- [LCS](/LeetCode/dp/lcs.md)

### LIS type
- [what_goes_up](/uva/dp/what_goes_up.md)

### TODO
- [aab](/Atcoder/dp/aab.md)
- [cooking](/Atcoder/dp/cooking.md)
- [fg_opeartion](/Atcoder/dp/fg_opeartion.md)
- [shipping_center](/Atcoder/dp/shipping_center.md)
- [strange_lunchbox](/Atcoder/dp/aab.md)

## Graphs
### Topological Sorting
- [course_schedule](/CSES/graphs/course_schedule.md)
- [game_routes](/CSES/graphs/game_routes.md)
- [longest_flight_route](/CSES/graphs/longest_flight_route.md)
- [Parallel course 3](/LeetCode/graph/parallel_courses_3.md)
- [Restricted permutation](/Atcoder/graphs/Restricted_Permutation.md)

### Shortest path
- [flight_discount](/CSES/graphs/flight_discount.md)
- [investigation](/CSES/graphs/investigation.md)
- [djikstra](/Codeforces/graphs/djikstra.md)
- [network_delay_time](/LeetCode/graph/network_delay_time.md)
- [8 puzzle on graph](/Atcoder/graphs/8-Puzzle-on-Graph.md)

### Flood fill
- [making_a_large_island](/LeetCode/graph/making_a_large_island.md)

### DFS
- [round_trip](/CSES/graphs/round_trip.md)
- [JMI ON campus](/JMI_on_campus/README.md)
- [Kings Path](/Codeforces/graphs/kings_path.md)

### BFS
- [graph_girth](/CSES/graphs/graph_girth.md)
- [word_ladder](/LeetCode/graph/word_ladder.md)

### 01 BFS
- [Wizard in maze](/Atcoder/graphs/wizard_in_maze.md)

### MSSP
- [01 Matrix](/LeetCode/graph/01matrix.md)

### MST
- [3-types](/hackerearth/README.md)

## Number theory
- [Amusement park](/Atcoder/maths_greedy/amusement_park.md)

## Searching and sorting
### Binary search type
- [Apartments](/CSES/searching_and_sorting/apartments.md)
- [Subarray sums 2](/CSES/searching_and_sorting/subarray_sums_2.md)
- [binary search in sorted array](/binary_search/binary_seach_in_sorted_array.md)
- [Koko eating bananas](LeetCode/binary_search/koko_eating_bananas.md)

## Data structure
### Stack
- [Longest valid paranthesis](/LeetCode/stack/longest_valid_paranthesis.md)
### DSU
- [Little Alawn's Puzzle](/Codeforces/dsu/little_alwan_puzzle.md)

## Adhoc, observation type
- [Polycarp and String Transformation](/Codeforces/observation/polycarp_and_string_transformation.md)

# Please follow these rules, if you wish to CONTRIBUTE.

### Current repo Structure. 

```js
ROOT
  |
  Platform_1
  |
  |___ Topic/Tag
  .      |____ problem_name/README.md
  .      |____ problem_name/README.md
  .      |____ problem_name/README.md
  .
  .
  |     
  Platform_2
  |
  |___ Topic/Tag
         |____ problem_name/README.md

 ```

## Structure of ProblemList.md

```js
Topic on which problem is base (preferrably h2, h3 heading)

Problem name, Easy / medium / hard (according to you)

- What makes it Easy/medium/hard according to you.
    |_____ point 1 
    |_____ point 2
    
- some key points, was there some different approach then regular?
    |_____ point 1
    |_____ point 2
    
- Appraoch (should be insightfull)
    
- corner cases, if you faced any
    |_____ point 1
    |_____ point 2
    
- code(it is advisable to copy RAW of similar problem on this repo, to save time)

- Similar problem if you encounter any.
```

### Some Templates you may inspire from
- [Normal template](CSES/dp/two_sets2.md)
- [dynamic programming type](CSES/dp/book_shop.md), if you wish to add more then 1 approach. [this one too](uva/dp/dollars.md)
- [Grapn type](CSES/graphs/flight_discount.md)

*to save time you can copy the template by viewing `RAW` file and fit in your content.*