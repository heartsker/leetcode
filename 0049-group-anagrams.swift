class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res: [String: [String]] = [:]

        for str in strs {
            res[String(str.sorted()), default: []].append(str)
        }

        return Array(res.values)
    }
}
