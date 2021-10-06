[875. Koko Eating Bananas](https://leetcode.com/problems/koko-eating-bananas/)
 
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

