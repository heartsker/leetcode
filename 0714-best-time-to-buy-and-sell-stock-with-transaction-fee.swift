class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
		var profits: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)

		profits[0][0] = 0 // no stock
		profits[0][1] = -prices[0] // have stock

		for i in 1..<prices.count {
			// no stock: max(no stock, have stock + price - fee)
			// for the case when we sell the stock
			profits[i][0] = max(profits[i - 1][0], profits[i - 1][1] + prices[i] - fee)
			// have stock: max(have stock, no stock - price)
			// for the case when we buy the stock
			profits[i][1] = max(profits[i - 1][1], profits[i - 1][0] - prices[i])
		}

		return profits[prices.count - 1][0]
	}
}
