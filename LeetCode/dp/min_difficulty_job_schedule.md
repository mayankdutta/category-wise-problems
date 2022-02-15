[1335. Minimum Difficulty of a Job Schedule](https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule/)

this is a problem where Dynamic programming can be used because we are asked for the minimum of something, and deciding how many jobs to do on a given day affects the jobs we can do on all future days.

<details> 
<summary> States </summary>

1. A **function** that answers the problem for a given state.
   Lets first decide on state variables. What decisions are there to make, and what information do we need to make these decisions? <br >Reading the problem description carefully, there are `d` total days, and on each day we need to complete some number of jobs. By the end of the `d` days, we must have finished all jobs (in the given order). Therefore, we can see that on each day, we need to decide how many jobs to take.

   - Lets use one state variable `i`, where `i` is the index of the first job that will be done on the current day.
   - Let's use another state variable `day`, _where `day` indicates what day it currently is._
   - The problem is asking for the minimum difficulty, so lets have a function `dp(i, day)` that returns the minimum difficulty of a job schedule which starts on the `i`th job and day, `day`. To solve the original problem, we will just return `dp(0, 1)`, since we start on the first day with no jobs done yet.

     ```js

     job difficulty: [6, 5, 3, 2 ,1]
     d = 2;

     dp(i, day) returns the minimum possible difficulty of a job schedule
     created starting from job i on day day.

     Returning dp(0, 1) would solve the original problem, because we start
     with the first job on the first job.


     ```

     ```js

     job difficulty [6, 5, 3, 2 ,1]
     d = 2;

     If we called dp(3, 2), for example, it would return the minimum difficulty of
     a job schedule that could be cerated if the highlighted section was the input,
     and if it was the 2nd day.

     Since day is dqual to d, it is the last day and we have to finish the rest of the jobs.
     Thus dp(3, 2) will return 3 because the most difficult day remaining has difficulty 3.

     ```

</details>

<details> 
<summary>Relation b/w states / Recurrence relation </summary>
  
  2. A **recurrence relation** to transition b/w states
  
  - At each state, we are on day `day` and need to do job `i`. Then, we can choose to do a few more jobs. <br>_How many jobs more are we allowed to do?_<br> The problem says that we need to do at least one job per day. this mans we must leave at least `d - day` jobs so that all the future days have _at least one job_ that can be scheduled on hat day. If n is the number of jobs, `jobDifficulty`. length that means from any give state (i, day), we are allowed to do the jobs from index i up to but not including index `n - (d - day)`.
  - we should try all the options for a given day
    - try doing only one job,
    - then two jobs, etc..
    - until we can't do any more jobs.
  - The best option is the one that results in the easiest job schedule.
  - The difficulty of a given day is the most difficult job that we did that day. Since the jobs have to be done in order, if we are trying all the jobs we are allowed to do on that day (iterating thorough them), then we can use a variable hardest to keep track of the difficult of the hardest job done today. If we choose to do jobs up to the `jth` job (inclusive), where `i <= j < (n - (d - day))`, (as derived above), then that means on the next day, we start from the `(j + 1)th` job. <br>Therefore, our total difficulty is `hardest + dp(j + 1, day + 1)`.
  - This will give us our scariest recurrence relation so far.
  
    ```js
    dp (i, day) = min(hardest + dp(j + 1, day + 1)), for all i <= j < n - (d -day)
    where hardest = max(jobDifficulty[k]) for all i <= k <= j.
  
    ```
  
  - On each day, we try all the options
    - do one job,
    - do two jobs etc...
    - until we can't do any more (since we need to leave some jobs for the future).
  - hardest is the hardest job we do on the current job, which means it is also the difficulty of the current day.
  - We add hardest to the next state which is the next day, starting with the next job.
  - After trying all the jobs we are allowed to do, choose the best result.
  
</details>

<details> 
<summary> Base case</summary>

3. **Base Case**

- Despite the recurrence relation being complicated, the base cases are much simpler.
- we need to finish all jobs in `d` days. Therefore if it is the last day (day == d), we need to finish up all the remaining jobs on this day, and the total difficulty will just be the largest number in `jobDifficulty` on or after index i.
- if day == d then return the maximum job difficulty between job i and the end of the array(inclusive).
- We can pre compute an array `hardestJobRemaining` where `hardestJobRemaining[i]` represents the difficulty of the hardest job on or after i, so that we this base case is handled in constant time.
- Additionally if there are more days than jobs(n < d), then it is impossible to do at least one job each day, and per the problem description, we should return -1, we can check for this case at very start.

</details>

<details> 
<summary>implementation</summary>

###### Top down

<details>
<summary> java implementation </summary>

```java
class Solution {
    private int n, d;
    private int[][] memo;
    private int[] jobDifficulty;
    private int[] hardestJobRemaining;

    private int dp(int i, int day) {
        // Base case, it's the last day so we need to finish all the jobs
        if (day == d) {
            return hardestJobRemaining[i];
        }

        if (memo[i][day] == -1) {
            int best = Integer.MAX_VALUE;
            int hardest = 0;
            // Iterate through the options and choose the best
            for (int j = i; j < n - (d - day); j++) {
                hardest = Math.max(hardest, jobDifficulty[j]);
                // Recurrence relation
                best = Math.min(best, hardest + dp(j + 1, day + 1));
            }
            memo[i][day] = best;
        }

        return memo[i][day];
    }

    public int minDifficulty(int[] jobDifficulty, int d) {
        n = jobDifficulty.length;
        // If we cannot schedule at least one job per day,
        // it is impossible to create a schedule
        if (n < d) {
            return -1;
        }

        hardestJobRemaining = new int[n];
        int hardestJob = 0;
        for (int i = n - 1; i >= 0; i--) {
            hardestJob = Math.max(hardestJob, jobDifficulty[i]);
            hardestJobRemaining[i] = hardestJob;
        }

        // Initialize memo array with value of -1.
        memo = new int[n][d + 1];
        for (int i = 0; i < n; i++) {
            Arrays.fill(memo[i], -1);
        }

        this.d = d;
        this.jobDifficulty = jobDifficulty;
        return dp(0, 1);
    }
}
```

</details>

###### Bottom up

- With the bottom up we now use a 2D array `dp[i][day]` represents the minimum difficulty of a job schedule that starts on day day and job i.
- It depends on the problem, but the bottom-up code generally has a faster runtime than it s top-down equivalent.
- We need to first tabulate the base case and then work backwards from them using nested for loops.
- The for loops should start iterating from the base cases, and there should be one for-loop for each state variable.
- Remember that one of our base cases is that on the final day, we need to complete all jobs.
- Therefore our for-loop iterating over day should iterate from the final day to the first day.
- Then, our next for-loop for i should conform to the restraints of the problem - we need to do a least one job per day.

<details>
<summary> java implementation </summary>

```java

class Solution {
    public int minDifficulty(int[] jobDifficulty, int d) {
        int n = jobDifficulty.length;
        // If we cannot schedule at least one job per day,
        // it is impossible to create a schedule
        if (n < d) {
            return -1;
        }

        int dp[][] = new int[n][d + 1];
        for (int[] row: dp) {
            Arrays.fill(row, Integer.MAX_VALUE);
        }

        // Set base cases
        dp[n - 1][d] = jobDifficulty[n - 1];

        // On the last day, we must schedule all remaining jobs, so dp[i][d]
        // is the maximum difficulty job remaining
        for (int i = n - 2; i >= 0; i--) {
            dp[i][d] = Math.max(dp[i + 1][d], jobDifficulty[i]);
        }

        for (int day = d - 1; day > 0; day--) {
            for (int i = day - 1; i < n - (d - day); i++) {
                int hardest = 0;
                // Iterate through the options and choose the best
                for (int j = i; j < n - (d - day); j++) {
                    hardest = Math.max(hardest, jobDifficulty[j]);
                    // Recurrence relation
                    dp[i][day] = Math.min(dp[i][day], hardest + dp[j + 1][day + 1]);
                }
            }
        }

        return dp[0][1];
    }
}
```

</details>
</details>

<details> 
<summary> Time complexity </summary>

###### Bottom up

- The time and space complexity of these algorithm can be quite tricky, and as in this example, there are something slight differences slight differences between the top-down and bottom-up complexities.
- In bottom-up, for in this problem, the number of states is `n.d`. This means the space complexity is O(n.d) as our dp table takes up that much space.

###### Top down

- The top-down algorithm's space complexity is actually a bit better.
- In top-down, when we memoize results with a hashtable, the hashtable's size only grows when we visit a state and calculate the answer for it.
- Because of the restriction of needing to complete at least one task per day, we don't actually need to visit all n.d states.
- For example, if there were 10 jobs and 5 days, then the state (9, 2) (starting the final job on the second day) is not reachable, because the 3rd, 4th, and 5th days wouldn't have a job to complete.
- This is true for both implementations and is enforced by our for-loops, and as a result, we only actually visit d .(n−d) states. This means the space complexity for top-down is O(d⋅(n−d)). This is one advantage that top-down can have over bottom-up. With the bottom-up implementation, we can't really avoid allocating space for n⋅d states because we are using a 2D array.

###### Summarise

- Time complexity (both algorithms): O(d . (n - d) ^ 2)
- space complexity (top-down): O(d . (n - d) )
- space complexity (bottom-up): O(d . (n) )

> While the theoretical space complexity is better with top-down, practically speaking, the 2D array is more space-efficient than a hashmap, and the difference in space complexities here doesn't justify saying that top-down will use less space than bottom-up.

</details>
