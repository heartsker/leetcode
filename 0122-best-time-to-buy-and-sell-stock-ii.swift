class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
		var sum = 0

		for i in 1..<prices.count {
			if prices[i] > prices[i - 1] {
				sum += prices[i] - prices[i - 1]
			}
		}

		return sum
    }
}
