class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let dict = nums.reduce(into: [:]) { counts, num in counts[num, default: 0] += 1 }
        return Array(dict.keys.sorted { dict[$0]! > dict[$1]! }[..<k])
    }
}
