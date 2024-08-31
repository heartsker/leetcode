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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        root == nil || isSymmetric(root?.left, root?.right)
    }

    func isSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        left == nil && right == nil ||
        left?.val == right?.val && isSymmetric(left?.left, right?.right) && isSymmetric(left?.right, right?.left)
    }
}
