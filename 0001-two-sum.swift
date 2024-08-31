class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()

        for (index, a) in nums.enumerated() {
            if let b = dict[a] {
                return [b, index]
            } else {
                dict[target - a] = index
            }
        }

        return []
    }
}
