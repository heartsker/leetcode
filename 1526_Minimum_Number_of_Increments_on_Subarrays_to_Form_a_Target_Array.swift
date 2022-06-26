class Solution {
    func minNumberOperations(_ target: [Int]) -> Int {        
        if target.isEmpty {
            return 0
        }
        
        var ans = target.first!
        
        for i in 1 ..< target.count {
            ans += max(target[i] - target[i - 1], 0)
        }
    
        return ans
    }
}