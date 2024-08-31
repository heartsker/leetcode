class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let s = Array(s), p = Array(p)
        var pd: [Character: Int] = [:]
        var sd: [Character: Int] = [:]

        for c in p {
            pd[c, default: 0] += 1
        }

        var res: [Int] = []

        for i in 0..<s.count {
            sd[s[i], default: 0] += 1

            if i < p.count - 1 { continue }

            if i >= p.count {
                sd[s[i - p.count], default: 0] -= 1
                if sd[s[i - p.count]] == 0 {
                    sd.removeValue(forKey: s[i - p.count])
                }
            }

            if pd == sd {
                res.append(i - p.count + 1)
            }
        }

        return res
    }
}
