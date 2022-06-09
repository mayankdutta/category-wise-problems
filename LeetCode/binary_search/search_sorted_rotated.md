[33. Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)

## method 1

- find the pivot, proceed the normal calculation.

```java
public int search(int[] nums, int target) {
    int n = nums.length;

    int low = 0;
    int high = n - 1;

    while (low < high) {
        int mid = (low + high) / 2;
        if (nums[mid] > nums[high]) {
            low = mid + 1;
        }
        else {
            high = mid;
        }
    }

    int rotated = low;
    low = -1;
    high = n;

    while (low + 1 < high) {
        int mid = (low + high) / 2;
        int modifiedMid = (mid + rotated) % n;

        if (nums[modifiedMid] == target) {
            return modifiedMid;
        }
        else if (nums[modifiedMid] > target) {
            high = mid;
        }
        else {
            low = mid;
        }
    }

    return -1;
}
```

#### Lets discuss the upper binary search loop.

- can't do `low <= high` because of `high = mid` condition,
  - if high will always be pointing to mid,
  - such that `low == mid == high` it will lead to infinite loop.
- can't do the [generalize method](/notes/binary_search/README.md) because indexes are innvolved in the while loop.
- can't do something like `low = mid + 1` and `high = mid - 1`, think about this

  ```js
               0  1  2
  let arr[] = [5, 1, 3]
  - low  = 0,
  - high = 2,
  - mid  = 1

  - we know arr[mid] < arr[high] : high should be @{mid - 1},
    BUT we cant really comment upon the (mid - 1)th element, since array isnt sorted
    we can comment only on (mid)th element.

  ______   ______
  sorted | sorted

  - (mid - 1)th element might become greater then arr[high]

  WHY low = mid + 1 ???
  - first to avoid TLE, else low will always be lower then high, wont exceed.
  - even if we did, either low will point to the end of current array OR the start of second array.
  - else we would have to manipulate the high one.

  ```

## method 2

- treat as two separate sorted array, merged together.

```java
public class Solution {
    public int search(int[] A, int target) {
        int lo = 0;
        int hi = A.length - 1;
        while (lo <= hi) {
            int mid = (lo + hi) / 2;
            if (A[mid] == target) return mid;

            if (A[lo] <= A[mid]) {
                if (A[lo] <= target && target < A[mid]) {
                    hi = mid - 1;
                } else {
                    lo = mid + 1;
                }
            } else {
                if (A[mid] < target && target <= A[hi]) {
                    lo = mid + 1;
                } else {
                    hi = mid - 1;
                }
            }
        }
        if (lo < 0 || lo >= A.length) return -1;
        return A[lo] == target ? lo : -1;
    }
}
```
