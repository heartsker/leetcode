struct Heap<T: Comparable> {
	// MARK: - Public properties

	var top: T? {
		elements.first
	}

	var count: Int {
		elements.count
	}

	// MARK: - Private properties

	private var elements: [T] = []

	private let comparator: (T, T) -> Bool

	// MARK: - Constructor

	init() {
		self.comparator = { $0 < $1 }
	}

	init(comparator: @escaping (T, T) -> Bool) {
		self.comparator = comparator
	}

	init<S: Sequence>(_ sequence: S) where S.Element == T {
		self.comparator = { $0 < $1 }
		elements = Array(sequence)
		heapify()
	}

	init<S: Sequence>(comparator: @escaping (T, T) -> Bool, _ sequence: S) where S.Element == T {
		self.comparator = comparator
		elements = Array(sequence)
		heapify()
	}


	// MARK: - Public methods

	mutating func insert(_ element: T) {
		elements.append(element)
		siftUp(from: elements.count - 1)
	}

	mutating func pop() -> T? {
		guard !elements.isEmpty else {
			return nil
		}

		elements.swapAt(0, elements.count - 1)
		let element = elements.removeLast()
		siftDown(from: 0)

		return element
	}

	// MARK: - Private methods

	private mutating func heapify() {
		for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
			siftDown(from: i)
		}
	}

	private mutating func siftDown(from index: Int) {
		var index = index

		while true {
			let leftChildIndex = 2 * index + 1
			let rightChildIndex = 2 * index + 2

			var nextIndex = index

			if leftChildIndex < elements.count && comparator(elements[leftChildIndex], elements[nextIndex]) {
				nextIndex = leftChildIndex
			}

			if rightChildIndex < elements.count && comparator(elements[rightChildIndex], elements[nextIndex]) {
				nextIndex = rightChildIndex
			}

			if nextIndex == index {
				break
			}

			elements.swapAt(index, nextIndex)
			index = nextIndex
		}
	}

	private mutating func siftUp(from index: Int) {
		var index = index

		while index > 0 {
			let parentIndex = (index - 1) / 2

			if comparator(elements[index], elements[parentIndex]) {
				elements.swapAt(index, parentIndex)
				index = parentIndex
			} else {
				break
			}
		}
	}
}