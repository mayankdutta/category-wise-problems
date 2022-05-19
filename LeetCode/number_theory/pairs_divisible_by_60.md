[1010. Pairs of Songs With Total Durations Divisible by 60](https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/), Medium

- first mod every no. with 60.
- then those which are divisible by 60 will turn out to be 0, take `nC2` from that.
- we will do the same in `n/2` kind of no.s
- and for the remaining one, we them pairwise and decrease them as we move.

<details>
<summary> code </summary>

```cpp
int numPairsDivisibleBy60(vector<int>& time) {
    map<int, int> mp;

    for (const auto& i: time)
        mp[i % 60] ++;

    int ans = (mp[0] * (mp[0] - 1))/2;

    for (auto &[key, value]: mp) {
        auto it = mp.find(60 - key);
        if (it != mp.end()) {
            (it -> first == key) ?
                ans += ((value * (value - 1)) / 2) :
                ans += (it -> second * value);

            int mn = min(it -> second, value);
            value -= mn;
            it -> second -= mn;
        }
    }
    return ans;
}


```

</details>

- since we are taking mod by 60.
- we know that resulting values won't exceed from 30.
- therefore can carry out some space optimizations.

<details>
<summary> optimal code </summary>

```cpp
class Solution {
   vector<int> freq = vector(60, 0);
public:
    int numPairsDivisibleBy60(vector<int>& time) {
        for(int i=0; i<time.size(); i++) {
            freq[time[i]%60]++;
        }
        int count=0;
        for(int i=0; i<=30; i++) {
            if((i== 0 || i==30 )) {
                if(freq[i]>1)
                    count += freq[i] * (freq[i]-1) * 1/2;
                continue;
            }
            int rem = 60 - i;
            count+= freq[rem] * freq[i];

        }
        return count;
    }
};

```

</details>
