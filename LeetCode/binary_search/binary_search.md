[Binary Search](https://leetcode.com/problems/binary-search/)

#### Method 1

- generic method,
- we use this method when we have 0 information about any element in `array`, so it's better to start from outside of the ranges.
- make sure that none of the internal statements inside the loop don't require indexing.
- while using this one, make sure to start low from `-1` and high from `nums.size()`.
- always think of `boundary cases`.
- make sure to make jump till `mid`.
- to avoid `TLEs` due to strange jumps, we have condition `low + 1 < high`

```cpp
int search(vector<int>& nums, int target) {
    int low = -1;
    int high = nums.size();

    while (low  + 1 < high) {
        int mid = (low + high) / 2;

        if (nums[mid] == target) {
            return mid;
        }
        else if (target < nums[mid]) {
            high = mid;
        }
        else {
            low = mid;
        }
    }
    return -1;
}
```

#### Method 2

```cpp
int search(vector<int>& nums, int target) {
    int low = 0;
    int high = nums.size() - 1;

    for (int t = 0; t < 50; t++) {
        int mid = (low + high) / 2;

        if (nums[mid] == target) {
            return mid;
        }
        else if (target < nums[mid]) {
            high = mid - 1;
        }
        else {
            low = mid + 1;
        }
    }
    return -1;
}
```

#### Method 3

- classic method.
- make sure to correctly initialize `low`, `high`.
- make sure to jump till `mid - 1`, or `mid + 1`.
- to make full traversal on each and every element don't use `low + 1 < high`

```cpp
int search(vector<int>& nums, int target) {
   int low = 0;
   int high = nums.size() - 1;

   while (low <= high) {
       int mid = (low + high) / 2;

       if (nums[mid] == target) {
           return mid;
       }
       else if (target < nums[mid]) {
           high = mid - 1;
       }
       else {
           low = mid + 1;
       }
   }
   return -1;
}
```
