- Small pattern that occasionally shows up in DP problems.
- Here, "doing nothing" refers to two different states having the same value.
- We're calling it "doing nothing" because often the way we arrive at a new state with the same value as the previous state is by "doing nothing".
- Of course, a decision making process needs to coexist with this pattern, because if we just had all states having the same value, the problem wouldn't really make sense `dp(i) = dp(i - 1)?)`.
- It is just that if we are trying to maximize or minimize a score for example, sometimes the best option is to "do nothing", which leads to two states having the same value.
- The actual recurrence relation would look something like `dp(i - 1, j), ...)}dp(i, j) = max(dp(i - 1, j), ...).`
- Usually when we "do nothing", it is by moving to the next element in some input array (which we usually use i as a state variable for).
- As mentioned above, this will be part of a decision making process due to some restriction in the problem.
- For example, think back to House Robber: we could choose to rob or not rob each house we were at.
- Sometimes, not robbing the house is the best decision (because we aren't allowed to rob adjacent houses), then `dp(i) = dp(i - 1).`
