class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var all = [Int]()
        var i = 0, j = 0
        while i < nums1.count || j < nums2.count {
            var n: Int
            if j >= nums2.count {
                all.append(nums1[i])
                i += 1
            } else if i >= nums1.count {
                all.append(nums2[j])
                j += 1
            } else {
                if nums1[i] <= nums2[j] {
                    all.append(nums1[i])
                    i += 1
                } else {
                    all.append(nums2[j])
                    j += 1
                }
            }
        }
        if all.count % 2 == 1 {
            return Double(all[all.count / 2])
        } else {
            return Double(all[all.count / 2] + all[all.count / 2 - 1]) / 2
        }
    }
}
