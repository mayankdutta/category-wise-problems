[2100. Find Good Days to Rob the Bank](https://leetcode.com/problems/find-good-days-to-rob-the-bank/), medium, prefix sums

- we have to check at every instance 
  - how many no.s will be smaller then current one.
  - and how many no.s will be greater then the current one.
- brute force will give TLE
- therefore will have to store such values apriori i.e. use prefix, suffix.

<details>
<summary> Code </summary> 

```cpp
  vector<int> goodDaysToRobBank(vector<int> &security, int time) {
    int n = security.size();
    vector<int> prefix(n, 0), suffix(n, 0);

    for (int i = 1; i < n; i++)
      if (security[i] <= security[i - 1])
        prefix[i] = prefix[i - 1] + 1;
    for (int i = n - 2; i >= 0; i--)

      if (security[i] <= security[i + 1])
        suffix[i] = suffix[i + 1] + 1;

    vector<int> ans;
    for (int i = 0; i < n; i++)
      if (prefix[i] >= time && suffix[i] >= time)
        ans.push_back(i);

    return ans;
  }

```
</details>
