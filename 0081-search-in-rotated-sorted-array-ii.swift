class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var l = 0, r = nums.count - 1

        while l <= r {
            let m = (l + r) / 2

            if nums[m] == target {
                return true
            }

            if nums[l] == nums[m], nums[r] == nums[m] {
                l += 1
                r -= 1
            } else if nums[m] >= nums[l] {
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

        return false
    }
}
