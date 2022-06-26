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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var start: ListNode? = head
        
        for _ in 0 ..< k - 1 {
            start = start?.next
        }
        
        if start == nil {
            return head
        } else {
            var current: ListNode?
            var tmp: ListNode?

            for _ in 0..<k {
                if current == nil {
                    current = head?.next
                    head?.next = reverseKGroup(start?.next, k)
                    start = head
                } else {
                    tmp = current?.next
                    current?.next = start
                    start = current
                    current = tmp
                }
            }

            return start
        }
    }
}