class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()

        for i in 0..<nums.count where i == 0 || nums[i - 1] < nums[i] {
            for j in i+1..<nums.count where j == i + 1 || nums[j - 1] < nums[j] {
                var l = j + 1, r = nums.count - 1

                while l < r {
                    let sum = nums[i] + nums[j] + nums[l] + nums[r]

                    if sum == target {
                        result.append([nums[i], nums[j], nums[l], nums[r]])
                    }

                    if sum < target {
                        let val = nums[l]
                        while l < r, nums[l] == val { l += 1 }
                    } else {
                        let val = nums[r]
                        while j < r, nums[r] == val { r -= 1 }
                    }
                }
            }
        }

        return result
    }
}
