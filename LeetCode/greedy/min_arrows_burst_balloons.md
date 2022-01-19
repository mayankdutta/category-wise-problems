[452. Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/)

- idea is pretty clear, it does seems like every interval kind of problem 
- we will have to sort it. 
- but with respect to what? 
- sorting wrt `X_end` may come in handy.
  - there will be more chance the `X_end` to get repeat in some interval then to `X_start`
  - We know that eventually we have to shoot down every balloon, 
  - so for each ballon there must be an arrow whose position is between balloon[0] and balloon[1] inclusively. 
  - Given that, we can sort the array of balloons by their ending position. 
  - Then we make sure that while we take care of each balloon in order, we can shoot as many following balloons as possible.



<details>
<summary> implementation </summary>

```cpp

class Solution {
    public:
    int findMinArrowShots(vector<vector<int>>& points) {
        vector<pair<int, int>> arr;

        for (const auto& i: points)
            arr.push_back({i[0], i[1]});

        sort(arr.begin(), arr.end(), [](const auto& one, const auto& two) -> bool {
            return one.second < two.second;
        });

        int count = 1;
        int curr = 0;

        for (int i = 1; i < arr.size(); i++) {
            if (arr[i].first <= arr[curr].second && arr[curr].second <= arr[i].second) {
                continue;
            }
            else {
                count ++;
                curr = i;
            }
        }
        return count;
    }
};

```

</details>
