/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        dfs(root).ok
    }

    func dfs(_ node: TreeNode?) -> (ok: Bool, h: Int) {
        guard let node else {
            return (true, 0)
        }

        let l = dfs(node.left)
        let r = dfs(node.right)

        let ok = (abs(l.h - r.h) <= 1) && l.ok && r.ok
        let h = 1 + max(l.h, r.h)

        return (
            ok: ok,
            h: h
        )
    }
}
