class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        dict(s) == dict(t)
    }

    func dict(_ s: String) -> [Character: Int] {
        var d = [Character: Int]()

        for c in s {
            d[c, default: 0] += 1
        }

        return d
    }
}
