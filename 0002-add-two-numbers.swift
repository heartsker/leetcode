// Definition for singly-linked list.
// public class ListNode {
//     public var val: Int
//     public var next: ListNode?
//     public init() { self.val = 0; self.next = nil; }
//     public init(_ val: Int) { self.val = val; self.next = nil; }
//     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
// }

// extension ListNode: CustomStringConvertible {
//     public var description: String {
//         String(val) + " " + (next?.description ?? "")
//     }
// }

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        guard l1 != nil || l2 != nil else { return nil }

        let head = ListNode()

        var last: ListNode? = nil

        var plus = 0

        while l1 != nil || l2 != nil {
            var current: ListNode
            if last == nil {
                current = head
                last = current
            } else {
                current = ListNode()
                last?.next = current
                last = current
            }
            let val = (l1?.val ?? 0) + (l2?.val ?? 0) + plus
            print(val)
            print(head)
            current.val = val % 10
            plus = val / 10

            print(ObjectIdentifier(current))

            l1 = l1?.next
            l2 = l2?.next
        }

        if plus > 0 {
            let current = ListNode(plus)
            last?.next = current
        }

        return head
    }
}