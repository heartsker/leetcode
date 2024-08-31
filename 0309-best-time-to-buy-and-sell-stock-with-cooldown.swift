class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = [-prices[0], 0, 0]

		// profit[0]: no stock
		// profit[1]: have stock
		// profit[2]: no stock with cooldown

        for i in 1..<prices.count {
            profit = [
                max(profit[0], profit[2] - prices[i]),
                profit[0] + prices[i],
                max(profit[1], profit[2])
            ]
        }

        return profit.max() ?? 0
    }
}
