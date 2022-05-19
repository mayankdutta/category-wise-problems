[Binary search in sorted array](https://leetcode.com/problems/single-element-in-a-sorted-array/), Medium
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

