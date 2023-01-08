[2426. Number of Pairs Satisfying Inequality](https://leetcode.com/problems/number-of-pairs-satisfying-inequality/)

## Merge Sort Method.
### Basically, count the greater element in the right hand side.

```js
nums1[i] - nums1[j] <= nums2[i] - nums2[j] + diff

(nums1[i] - nums2[i]) - (nums2[j] - nums2[j]) <= diff;

A[i] - A[j] <= diff 

A[i] - diff <= A[j]
```

- count all the pairs having `A[i] - diff <= A[j]`.
- similar to count inversion, 
- but instead of the inversion we have to maintain another Inequality.
- **NOTE**
  - while calculating the above inequality don't try to store the sorted part of array. 
  - that we usually do in typical merge sort. 
  - if you really want to attempt sorting via this.
  - do so in other while loops. 
- **NOTE**
  - also don't try to sort the array, because position must not change.


```cpp
class Solution {
public:
    using ll = long long int;
    int diff;
    
    ll merge(vector<int>& arr, int left, int mid, int right) {
        int i = left; 
        int j = mid + 1;
        
        ll count = 0;
        
        while (i <= mid && j <= right) {
            if (arr[i] - diff <= arr[j]) {
                count += (right - j + 1);
                i ++;
            } else {
                j ++;
            }
        }
        
        sort(arr.begin() + left, arr.begin() + right + 1);
        return count;
    }
       
    
    void merge_sort(vector<int>& arr, int left, int right, ll &count) {
        if (left < right) {
            int mid = (left + right) >> 1;
            merge_sort(arr, left, mid, count);
            merge_sort(arr, mid + 1, right, count);
            count += merge(arr, left, mid, right);
        }
    }
    
    long long numberOfPairs(vector<int>& nums1, vector<int>& nums2, int diff) {
        vector<int> arr; 
        this->diff = diff;
        
        int n = nums1.size();
        
        for (int i = 0; i < n; i++) {
            arr.push_back(nums1[i] - nums2[i]);
        }
        
        ll count = 0;
        merge_sort(arr, 0, n - 1, count);
        return count;
    }
};
```
