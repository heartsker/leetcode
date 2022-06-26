class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {

        let n = nums1.count + nums2.count

        var i = 0, j = 0

        var first: Int? = nil
        var second: Int? = nil

        for _ in 0 ... n / 2 {
            if j >= nums2.count || i < nums1.count && nums1[i] <= nums2[j] {
                first = second
                second = nums1[i]
                i += 1
            } else {
                first = second
                second = nums2[j]
                j += 1
            }
        }

        if n % 2 == 1 {
            return Double(second ?? 0)
        } else {
            return Double((first ?? 0) + (second ?? 0)) / 2
        }
    }
}
