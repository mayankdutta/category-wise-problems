## Please follow these rules, if you wish to CONTRIBUTE.

#### Current repo Structure.

```text
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

### Structure of ProblemList.md

```text

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

#### Some Templates you may inspire from

- [Normal template](CSES/dp/two_sets2.md)
- [dynamic programming type](CSES/dp/book_shop.md), if you wish to add more then 1
  approach. [this one too](uva/dp/dollars.md)
- [Graph type](CSES/graphs/flight_discount.md)

_to save time you can copy the template by viewing `RAW` file and fit in your content._

### Tag Vocabulary

Every problem note carries a `**Tags:**` line. Use **only** the tags below — this
is a closed vocabulary so search stays consistent (`grep -rl "dijkstra" .`). All
tags are lowercase and hyphenated; never invent synonyms (`shortest-path`, not
`Shortest Paths`).

Pick **one Tier-1 category** (it usually matches the directory) plus **1–3 Tier-2
tags** for the specific techniques used. A Tier-1 category word may also be used
as a secondary tag when a problem leans on that area as a secondary technique
(e.g. `prefix-sum heap`, `graph dp`).

```text
**Tags:** dp knapsack state-compression
**Tags:** graph dijkstra binary-search-on-answer
**Tags:** prefix-sum hashmap two-sum
```

Derived from the topic lists of cp-algorithms, the CSES problem set, the USACO
Guide, and the Codeforces problemset tags.

The [Tag Index](/TAGS.md) is generated from these `**Tags:**` lines by
`scripts/gen_tags_index.py`. To keep it regenerated automatically on every
commit, enable the hook once per clone:

```sh
git config core.hooksPath scripts/hooks
```

#### Tier 1 — Category (pick exactly one)

```text
dp        graph     tree      bst       linked-list  stack
heap      dsu       trie      strings   prefix-sum   binary-search
greedy    intervals number-theory       bit-manipulation
implementation      range-queries       geometry     math
```

#### Tier 2 — Technique tags (pick any that apply)

```text
# paradigm / approach
constructive  brute-force  divide-and-conquer  two-pointers
sliding-window  binary-search-on-answer  backtracking
meet-in-the-middle  ternary-search  interactive  game-theory
offline-queries  fast-slow-pointers  boyer-moore-voting  inversion-count

# dynamic programming
knapsack  unbounded-knapsack  lis  grid-dp  fibonacci-dp  tree-dp
state-compression  interval-dp  digit-dp  bitmask-dp  probability-dp
lcs  edit-distance  kadane  dp-optimization
counting-dp  subset-sum  linear-dp

# graphs
bfs  dfs  flood-fill  topological-sort  dijkstra  01-bfs
multisource-bfs  mst  shortest-path  bellman-ford  floyd-warshall
scc  bridges-articulation  2-sat  bipartite  eulerian-path
functional-graph  max-flow  bipartite-matching  lca  binary-lifting
euler-tour  heavy-light-decomposition  centroid-decomposition
dag-dp  tree-traversal  morris-traversal

# data structures
monotonic-stack  monotonic-deque  hashmap  two-sum  difference-array
segment-tree  fenwick-tree  sparse-table  sqrt-decomposition
mos-algorithm  ordered-set  top-k

# strings
string-hashing  kmp  z-function  suffix-array  aho-corasick  manacher

# math / number theory
gcd-lcm  modular-arithmetic  sieve  catalan  combinatorics
binomial-coefficients  inclusion-exclusion  modular-inverse  crt
binary-exponentiation  matrix-exponentiation  fft  factorization

# sorting / geometry / misc
sorting  coordinate-compression  custom-comparator
convex-hull  sweep-line  line-intersection
```
