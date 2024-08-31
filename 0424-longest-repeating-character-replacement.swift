class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var windowStart = 0, mx = 0, maxChar = 0
        var inputString = Array(s)
        var dict = [Character: Int]()

        for windowEnd in 0..<inputString.count{
            dict[inputString[windowEnd], default: 0 ] += 1
            maxChar = max(maxChar, dict[inputString[windowEnd], default: 0])
            let replaceCharCount = (windowEnd - windowStart + 1) - maxChar
            if replaceCharCount <= k{
                mx = max(mx, windowEnd - windowStart + 1 )
            }else{
                while( ((windowEnd - windowStart + 1) - maxChar) > k){
                    dict[inputString[windowStart], default: 0 ] -= 1
                    windowStart += 1
                }
            }
        }
        return mx
    }
}
