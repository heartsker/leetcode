class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1

        var res = nums[0]

        while l <= r {
            let m = (l + r) / 2

            print(l, r, m, nums[m])

            if nums[m] > nums[r] {
                res = min(res, nums[r])
                l = m + 1
            } else {
                res = min(res, nums[m])
                r = m - 1
            }
        }

        return res
    }
}

Solution().findMin([3,1,2])
