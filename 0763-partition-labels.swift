class Solution {
    @_optimize(speed)
    func partitionLabels(_ s: String) -> [Int] {
        var dict = [Character: Int]()

        for (i, c) in s.enumerated() {
            dict[c] = i
        }

        var res: [Int] = []

        var finish = 0

        for (i, c) in s.enumerated() {
            finish = max(finish, dict[c]!)
            if i == finish {
                res.append(i - res.reduce(0, +) + 1)
            }

        }

        return res
    }
}
