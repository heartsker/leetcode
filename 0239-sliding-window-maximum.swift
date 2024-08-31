import Collections

struct Element: Comparable {
    let val: Int
    let index: Int

    public static func <(lhs: Element, rhs: Element) -> Bool {
        (lhs.val, lhs.index) < (rhs.val, rhs.index)
    }
}

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var heap = Heap<Element>()
        var res: [Int] = []

        for i in 0..<(k-1) {
            heap.insert(Element(val: nums[i], index: i))
        }

        for i in 0...(nums.count - k) {
            heap.insert(Element(val: nums[i + k - 1], index: i + k - 1))

            while heap.max!.index < i {
                heap.popMax()
            }
            res.append(heap.max?.val ?? 0)
        }

        return res
    }
}
