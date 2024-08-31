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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root else {
            return []
        }
        if root.left == nil, root.right == nil, root.val == targetSum {
            return [[root.val]]
        }

        var result = [[Int]]()

        for child in [root.left, root.right] {
            if let child {
                let paths = pathSum(child, targetSum - root.val)
                for path in paths {
                    var copy = path
                    result.append([root.val] + path)
                }
            }
        }

        return result
    }
}
