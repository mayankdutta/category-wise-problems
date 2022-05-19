[525. Contiguous Array](https://leetcode.com/problems/contiguous-array/), prefix sums, map, medium

- only 2 values are there, 0 and 1.
- a prefix table is prepared in a kind of unique way.
- count will be added by one if current element is 1, else will be subtracted by one.
- we will get an array of count.
- now in this array of count we will locate the maximum distance b/w any same values.
- the distance b/w the same values would imply that equal no. of zeroes were there,
  to make the value of count the same instead of increasing

<details> 
<summary> Implementation </summary>

```cpp
int findMaxLength(vector<int>& nums) {
   int n = nums.size();

   map<int, int> mp;
   int count = 0;

   int ans = 0;
   mp[0] = 0;
   for (int i= 0; i < n; i++) {
       nums[i] == 0 ? count -- : count ++;

       (mp.count(count)) ?
           ans = max(ans, i + 1 - mp[count]):
           mp[count] = i + 1;

   }

   return ans;

}

```

</details>

<details> 
<summary>Java Implementation</summary>

```cpp
class Solution {
    public int findMaxLength(int[] nums) {
        Map<Integer, Integer> track = new HashMap<>();
        track.put(0, -1);
        int ans = 0;
        int count = 0;
        for (int i = 0; i < nums.length; i++) {
            count += (nums[i] == 0 ? -1 : 1);

            if (track.containsKey(count)) {
                ans = Math.max(i - track.get(count), ans);
            }
            else {
                track.put(count, i);
            }
        }
        return ans;
    }
}

```

</details>
