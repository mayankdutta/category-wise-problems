[652. Find Duplicate Subtrees](https://leetcode.com/problems/find-duplicate-subtrees/)

##### Based upon the Post order traversal AND serialize deserialize, HOW? 
> subtree always involves leaves therefore evolving from leaf seems better idea. <br>
> In post order priority is given to `left`, `right` then to leaf.

- make post order traversal first.
- after done traversing comes the calculation part. 
- maintain the count of every `subtree from leaf to root` and store them in map.
- if `occurrence = 2` store in the answer, that value is the final, it wont be updating again.
- because we only moving upward and always adding something.

```java
class Solution {
    HashMap<String, Integer> map;
    ArrayList<TreeNode> arr;
    
    public String pre(TreeNode root) {
        if (root == null) 
            return "#";
        
        String left = pre(root.left);
        String right = pre(root.right);
        
        String curr = left + "," + right + "," + Integer.toString(root.val);
        map.put(curr, map.getOrDefault(curr, 0) + 1);
        if (map.get(curr) == 2) 
            arr.add(root);
        
        return curr;
    }
    
    public List<TreeNode> findDuplicateSubtrees(TreeNode root) {
        map = new HashMap<>();
        arr = new ArrayList<>();
        String ans = pre(root);
        return arr;
    }
}
```
