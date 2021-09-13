##  Dijkstra algorithm / Floyd warshall
1. [Network Delay Time](https://leetcode.com/problems/network-delay-time/), Medium
    - Things I learnt
      - basic implementation of Djikstra
      - this can also be solved via floyd, iff constraints are low. 

## Binary Search
1. [Binary search in sorted array](https://leetcode.com/problems/single-element-in-a-sorted-array/), Medium
    - Problem Description
      - You are given a sorted array consisting of only integers 
      - where every element appears exactly twice, 
      - except for one element which appears exactly once. 
      - **Find this single element that appears only once.**
    - Follow up
      - Your solution should run in O(logN) time and O(1) space.
    - Examples
       <details> 
        <summary>Example </summary>

        Input: nums = [3,3,7,7,10,11,11] <br>
        Output: 10
      </details>
    - Approach
      - It is evident from the input above that a new number starts from even index and ends at immediate next index i.e. next odd index
for example,if the given `array` is `[1,1,2,2,3,3,4,4]`
new element can be seen at `index: 0,2,4,6`
(Note:Array consists of duplets only)
      - But **WHAT IF** array consists of one single element as well?
example:`[1,1,2,2,3,4,4]`
Then the order of new element will be disrupted after the single element
So now new element can be found at `index: 0,2,4,5`
      - But **WHAT IF** array consists of one single element as well?
`example:[1,1,2,2,3,4,4]`
Then the order of new element will be disrupted after the single element
So now new element can be found at `index: 0,2,4,5`
      - Example : `n=7`
`arr=[3,3,7,7,10,11,11]`
`mid= index 3;`
since mid is **odd** and `arr[mid] == arr[mid-1]` it means upto index 3 the array consists of all the duplicates so we move towards right and rellocate low to mid+1;
       
      <details>
      <summary>Sample Code</summary>

        ```cpp
        int singleNonDuplicate(vector<int> &nums) {
            int low, mid, high, prev, next, n = nums.size();
            low = 0;
            high = nums.size() - 1;
            if (nums.size() == 1)
                return nums[0];
            while (low <= high) {
                mid = low + (high - low) / 2;
                prev = (mid + n - 1) % n;
                next = (mid + 1) % n;
      
                /* if(prev element!=curr element & next element != curr element then it is unique) */ 
                if (nums[mid] != nums[prev] && nums[mid] != nums[next]) // 
                    return nums[mid];
                else if (mid % 2 == 1 && nums[mid] == nums[prev] || mid % 2 == 0 && nums[mid] == nums[next])
                    low = mid + 1;
                else if (mid % 2 == 0 && nums[mid] == nums[prev] || mid % 2 == 1 && nums[mid] == nums[next])
                    high = mid - 1;
            }
            return -1;
        }


        ```
     </details>



2. [875. Koko Eating Bananas](https://leetcode.com/problems/koko-eating-bananas/)
    
    - A fine problem on binary search (a good example of BS over unsorted content)
      
      <details>
      <summary>Sample Code</summary>

        ```cpp
        class Solution {
        public:
            int minEatingSpeed(vector<int>& piles, int h) {
                // consider this as a sequence of ( possible[0] , possible[1] , possible[2] , possible[3] , ..)
                // then for values it will look something like (false, false , false , . .. true,true true)
                // intuition is that if any x is a possible answer it is guaranteed that x+1, x+2 .. will also be an answer
                
                int high = *max_element(piles.begin(),piles.end());
                int low = 1;
                
                while(low < high){
                    int mid = low + (high-low)/2;
                    int timeNeeded = 0; 
                    for(auto&x:piles){
                        timeNeeded += (x/mid);
                        if(x%mid) timeNeeded++;
                    }
                    if(timeNeeded > h)
                        low = mid + 1;
                    else high = mid;
                }
                return low;
                
            }
        };

        ```
     </details>
	
##  MSSP
   1. [01 Matrix](https://leetcode.com/problems/01-matrix/), Medium
       - Base on classical approach of MSSP(multisource shortest path OR multisource BFS)
       - similar problem, [monsters](https://cses.fi/problemset/task/1194)
       - Things I learnt
           - basic implementation of multisouce BFS
       - Approach 
         - stored all the points in the queue, whose distance is known to me. 
         - will traverse BFS on rest of the points, which question is asking me to.
            <details>
            <summary>Implementation</summary>

            ```cpp
            
            int dr[] = {-1, 1, 0, 0}; 
            int dc[] = {0, 0, -1, 1};
            class Solution {
                public:
                vector<vector<int>> updateMatrix(vector<vector<int>>& mat) {
                    int n = mat.size();
                    int m = mat[0].size();
                    vector<vector<int>> dist(n, vector<int>(m, 1e9));
                    vector<vector<bool>> used(n, vector<bool>(m, false));
                    queue<pair<int, int>> qu;
            
                    for (int i = 0; i < n; i++)
                        for (int j = 0; j < m; j++)
                            if (mat[i][j] == 0) {
                                qu.push({i, j});
                                dist[i][j] = 0;
                                used[i][j] = true;
                            }
            
                    while (!qu.empty()) {
                        auto [r, c] = qu.front();
                        qu.pop();
            
                        for (int i = 0; i < 4; i++) {
                            int rr = dr[i] + r;
                            int cc = dc[i] + c;
            
                            if (rr < 0 or cc < 0 or rr >= n or cc >= m or used[rr][cc])
                                continue;
            
                            used[rr][cc] = true;
                            qu.push({rr, cc});
            
                            dist[rr][cc] = dist[r][c] + 1;
                        }
                    }
                    return dist;
                }
            };
            
            
            ```
            </details>
         
## Flood fill
1. [827. Making A Large Island](https://leetcode.com/problems/making-a-large-island/), **Medium** *(if aware of flood fill) else* **Hard**
    - Problem necessitates Flood fill concepts and coloring the graphs.
    - Approach 
      - We first traverse accross components that are **not connected**
      - We give them some color *(0, 1, 2 ,3 ... )* and store their size.
      - We then in another loop traverse only at points of no Land *i.e. where grid[i][j] == 0*
      - and check what is the colour of the point located to its *(left /right/ down/ up)*.
    - code

      <details>
      <summary>BFS Implementation</summary>

        ```cpp
      
        int dr[] = {1, -1, 0, 0};
        int dc[] = {0, 0, -1, 1};
        int largestIsland(vector<vector<int>> &grid) {
        int n = grid.size();
        int m = grid[0].size();
        
        vector<vector<int>> used(n, vector<int>(m, false));
        queue<pair<int, int>> qu;
        map<int, int> mp;
        
        int color = 1;
        mp[0] = 0;
        int ans = 0;
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 1 and !used[i][j]) {
                    int Size = 1;
                    qu.push({i, j});
                    used[i][j] = color;
                    
                    while (!qu.empty()) {
                        auto [r, c] = qu.front();
                        qu.pop();
                        
                        for (int k = 0; k < 4; k++) {
                            int rr = r + dr[k];
                            int cc = c + dc[k];
                            
                            if (rr < 0 or cc < 0 or rr >= n or cc >= n or used[rr][cc] or grid[rr][cc] != 1)
                                continue;
                            qu.push({rr, cc});
                            used[rr][cc] = color;
                            Size++;
                        }
                    }
                    ans = max(ans, Size);
                    mp[color] = Size;
                    color++;
                }
            }
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (grid[i][j] == 0) {
                    int sum = 0;
                    map<int, bool> usedColor;
                    for (int k = 0; k < 4; k++) {
                        int rr = i + dr[k];
                        int cc = j + dc[k];
                        
                        if (rr < 0 or cc < 0 or rr >= n or cc >= n)
                            continue;
                        int currentColor = used[rr][cc];
                        if (usedColor.count(currentColor))
                            continue;
                        
                        sum += (mp[currentColor]);
                        if (currentColor != 0) {
                            usedColor[currentColor] = true;
                        }
                    }
                    ans = max(ans, sum + 1);
                }
            }
        }
        return ans;

        ```
     </details>
##  BFS, shortest paths.
1. [127. Word Ladder ](https://leetcode.com/problems/word-ladder/), Hard
    - question was really simple,
        - you have been given several words
        - You are allowed to make edge on the words having only one distinct word.
    - What make it difficult.
      - we are given strings hence, normal adjacency list won't work 
      - we'll have to make using maps
      - Searching for one distinct word may get little trickier.
    - Approach
      - Starting from BeginWord we initiated our BFS. 
      - Meanwhile stored their distance in `distance map`, just as normal BFS
      - While comparing two string have one distinct or not.
        - We replace each character of a `particular string`, index wise from `a - z`
        - Aslo we make sure if this modified string is already present in wordList or not. 
        - Since we only changing one character per time, therefore if modified string is already present, we insert this in our queue.
      <details>
      <summary>Sample Code</summary>

        ```cpp
        int ladderLength(string beginWord, string endWord, vector<string> &s) {
            queue<string> que;
            que.push(beginWord);
            
            unordered_map<string, int> distance;
            unordered_set<string> wordListsSet;
            
            /* so that searching string can be easier */
            for (const auto &i : s)
                wordListsSet.insert(i);
            
            distance[beginWord] = 1;
            
            while (!que.empty()) {
                auto u = que.front();
                que.pop();
                
               /* replaced each character index wise in string  */
               /* and checked if that modified string is present in the set or not */
               for (int j = 0; j < u.size(); j++) {
                   auto temp = u;
                   for (char ch = 'a'; ch <= 'z'; ch++) {
                       temp[j] = ch;
                       if (distance.count(temp))
                           continue;
                       if (wordListsSet.find(temp) != wordListsSet.end()) {
                           que.push(temp);
                           distance[temp] = distance[u] + 1;
                           
                           if (temp == endWord)
                               return distance[temp];
                       }
                   }
               }
            }
            return distance[endWord];
        }



        ```
     </details>
    
## DP
1. [1143. Longest Common Subsequence ](https://leetcode.com/problems/longest-common-subsequence/), Easy, classic dp
    - Given two string, we are required to find the longest Common subsequence.
    - Approach
        - consider two pointers `i and j`, pointing towards string `s, t`.
        - The process of increasing the pointers can be seen as moving fwd *(if i is increase)*, or moving dwn *(if j is increase)*.
        - *or* moving `diagonally` if both i and j increases. 
        - Then our ans. will be maximum no. of **diagonal movements.** *(the no. of times both increase)*
    - code

      <details>
      <summary>Implementation</summary>

        ```cpp
        int longestCommonSubsequence(string s, string t) {
            int n = s.size(); 
            int m = t.size();
            int dp[n + 1][m + 1];
            
            for (int i = 0; i <= n; i++) {
                for (int j = 0; j <= m; j++) {
                    if (i == 0 or j == 0) dp[i][j] = 0;
                    else if (s[i - 1] == t[j - 1])  dp[i][j] = dp[i - 1][j - 1] + 1;
                    else dp[i][j] = max(dp[i][j-  1], dp[i - 1][j]);
                }
            }
            return dp[n][m];
        }

        ```
     </details>
