class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count

        while l + 1 < r {
            let m = (l + r) / 2

            if nums[m] <= target {
                l = m
            } else {
                r = m
            }
        }

        return nums[l] == target ? l : -1
    }
}
