/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var numbers = [Int]()
        
        for list in lists {
            var node = list
            while node != nil {
                numbers.append(node!.val)
                node = node?.next
            }
        }
        
        numbers.sort()
        
        var current: ListNode? = ListNode()
        var start = current
        
        for n in numbers {
            current?.next = ListNode(n)
            current = current?.next
        }
        
        return start?.next
    }
}