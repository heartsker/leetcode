class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1

        while l <= r {
            let m = (l + r) / 2

            if nums[m] == target {
                return m
            }

            if nums[m] >= nums[l] {
                if nums[l] <= target && target < nums[m] {
                    r = m - 1
                } else {
                    l = m + 1
                }
            } else {
                if nums[m] < target && target <= nums[r] {
                    l = m + 1
                } else {
                    r = m - 1
                }
            }
        }

        return -1
    }
}

Solution().search([1, 3], 0)
