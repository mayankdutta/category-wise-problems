[863. All Nodes Distance K in Binary Tree](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/)

## Block Node concept

### Distance target

- in the function `distanceTarget` we are trying to find a chain of nodes.
- starting from the root till the `target` met.
- for this we will first `preOrder`, until we find `target`.
- as we found out, we will end our `preOrder` traversal there.
- we will then do `postOrder` Operations and signal parent accordingly.
- if parent receives `false` from both child via `preOrder Signalling`, we will pop out the pushed element.
- This will get us the `parents`, `grandparents` of target, till the root.

```java
public boolean distanceTarget(TreeNode root, TreeNode target) {
    if (root == null) {
        return false;
    }
    if (root.val == target.val) {
        arr.add(root);
        return true;
    }

    arr.add(root);
    boolean left = distanceTarget(root.left, target);
    boolean right = distanceTarget(root.right, target);

    if (left == false && right == false) {
        if (!arr.isEmpty())
            arr.remove(arr.size() - 1);
        return false;
    }
    return (left || right);
}

```

### Dist

- now that we have this chain, [`target`, `parentOfTarget`, `...`, `parent`].
- we will start from the first element of above array.
- from `target` we will do any traversal but will stop as we found the `nullptr` (**blockNode**).
- from `parentOfTarget` we will do any traversal but will stop as we found the `target` (**blockNode**).
- from `root` we will do any traversal but will stop as we found the `n - 2 th element` (**blockNode**).
- since we are traversing from the required node to downward tree, and ignoring a particular subtree, along with particular distance, we are bound to get the required result in whole tree.
- meanwhile we keep updating the `distance` which is passed as parameter.
- but we will limit our traversal upto min(k, chain.size())
- In this way we will get all the nodes having `kth` distance from the target.

```java

void dist(TreeNode root, TreeNode blocked, int k) {
    if (root == null) {
        return;
    }
    if (root == blocked) {
        return;
    }
    if (k == 0) {
        ans.add(root.val);
    }
    dist(root.left, blocked, k - 1);
    dist(root.right, blocked, k - 1);
}

```

<details>
<summary> Complete implementation </summary>

```java
class Solution {
    ArrayList<TreeNode> arr;
    ArrayList<Integer> ans;

    public boolean distanceTarget(TreeNode root, TreeNode target) {
        if (root == null) {
            return false;
        }
        if (root.val == target.val) {
            arr.add(root);
            return true;
        }

        arr.add(root);
        boolean left = distanceTarget(root.left, target);
        boolean right = distanceTarget(root.right, target);

        if (left == false && right == false) {
            if (!arr.isEmpty())
                arr.remove(arr.size() - 1);
            return false;
        }
        return (left || right);
    }

    void dist(TreeNode root, TreeNode blocked, int k) {
        if (root == null) {
            return;
        }
        if (root == blocked) {
            return;
        }
        if (k == 0) {
            ans.add(root.val);
        }
        dist(root.left, blocked, k - 1);
        dist(root.right, blocked, k - 1);
    }

    public List<Integer> distanceK(TreeNode root, TreeNode target, int k) {
        arr = new ArrayList<TreeNode>();
        ans = new ArrayList<Integer>();

        distanceTarget(root, target);
        Collections.reverse(arr);

        for (var i: arr) {
            System.out.print(i.val + " ");
        } System.out.println("");

        for (int i = 0; i <= Math.min(k, arr.size() - 1); i++) {
            dist(arr.get(i), i == 0 ? null : arr.get(i - 1), k - i);
        }

        return ans;
    }
}
```
</details>
