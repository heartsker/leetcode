class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var l = 0, r = height.count - 1

        var res = 0

        while l < r {
            print(l, r)
            res = max(res, (r - l) * min(height[l], height[r]))

            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }

        return res
    }
}

Solution().maxArea([1,2,4,3])
