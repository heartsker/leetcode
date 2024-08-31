class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { lhs, rhs in
            (lhs[0], lhs[1]) < (rhs[0], rhs[1])
        }

        var s = intervals[0][0]
        var f = intervals[0][1]

        var res: [[Int]] = []

        for interval in intervals {
            if f >= interval[0] {
                f = max(f, interval[1])
            } else {
                res.append([s, f])
                s = interval[0]
                f = interval[1]
            }
        }

        res.append([s, f])

        return res
    }
}
