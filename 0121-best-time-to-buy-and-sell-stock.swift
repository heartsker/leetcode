class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var mi = prices[0]
        var best = 0
        for price in prices {
            if price < mi {
                mi = price
            }
            else if price - mi > best {
                best = price - mi
            }
        }

        return best
    }
}
