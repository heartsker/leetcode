import Collections

struct Element: Comparable {
	let count: Int
	let word: String

	public static func <(lhs: Element, rhs: Element) -> Bool {
		(lhs.count, rhs.word) < (rhs.count, lhs.word)
	}
}

class Solution {
    @_optimize(speed)
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        let dict: [String : Int] = words.reduce(into: [:]) {
			counts, word in counts[word, default: 0] += 1
		}

		var heap = Heap<Element>()

		for (word, count) in dict {
			heap.insert(Element(count: count, word: word))
		}

		var res: [String] = []

		for _ in 0..<k {
			res.append(heap.popMax()!.word)
		}

		return res
    }
}
