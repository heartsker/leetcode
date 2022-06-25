class Solution {

    func isMatch(_ s: String, _ p: String) -> Bool {

        let charsS = Array(s)
        let charsP = Array(p)

        var dp = Array(repeating: Array(repeating: false,
                                        count: charsP.count + 1),
                       count: charsS.count + 1)

        dp[0][0] = true

        for i in 0 ... charsP.count {
            dp[0][i] = i == 0 || i > 1 && dp[0][i - 2] && charsP[i - 1] == "*"
        }

        for i in 0 ... charsS.count {
            for j in 1 ... charsP.count {

                if charsP[j - 1] != "*" {
                    dp[i][j] = i > 0 && dp[i - 1][j - 1] && (charsP[j - 1] == "." || charsP[j - 1] == charsS[i - 1])
                } else {
                    dp[i][j] = dp[i][j - 2] || i > 0 && j > 1 && (charsS[i - 1] == charsP[j - 2] || charsP[j - 2] == ".") && dp[i - 1][j]
                }
            }
        }

        return dp[charsS.count][charsP.count]
    }
}
