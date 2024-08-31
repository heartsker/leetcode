class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var l = 0, r = matrix.count

        while l + 1 < r {
            let m = (l + r) / 2

            if matrix[m][0] > target {
                r = m
            } else {
                l = m
            }
        }

        let row = l

        l = 0
        r = matrix[row].count

        while l + 1 < r {
            let m = (l + r) / 2

            if matrix[row][m] > target {
                r = m
            } else {
                l = m
            }
        }

        return matrix[row][l] == target
    }
}
