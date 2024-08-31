class Solution {
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        var lowHeap = Heap<Int>(>)
        var highHeap = Heap<Int>(<)

        var counts: [Int: Int] = [:]

        for i in 0..<k {
            lowHeap.insert(nums[i])
        }

        for _ in 0..<(k / 2) {
            highHeap.insert(lowHeap.pop()!)
        }

        var result = [Double]()

        let median: () -> Double = {
            if k % 2 == 0 {
                return Double(lowHeap.top!) / 2 + Double(highHeap.top!) / 2
            } else {
                return Double(lowHeap.top!)
            }
        }

        result.append(median())

        for i in k..<nums.count {
            let old = nums[i - k]
            let new = nums[i]

            counts[old, default: 0] += 1

            var balance = (new <= lowHeap.top! ? -1 : 1) + (old <= lowHeap.top! ? 1 : -1)

            new <= lowHeap.top! ? lowHeap.insert(new) : highHeap.insert(new)

            if balance > 0 {
                lowHeap.insert(highHeap.pop()!)
            } else if balance < 0 {
                highHeap.insert(lowHeap.pop()!)
            }

            while !lowHeap.isEmpty && counts[lowHeap.top!, default: 0] > 0 {
                counts[lowHeap.top!]! -= 1
                lowHeap.pop()
            }

            while !highHeap.isEmpty && counts[highHeap.top!, default: 0] > 0 {
                counts[highHeap.top!]! -= 1
                highHeap.pop()
            }

            result.append(median())
        }

        return result
    }
}
