class Solution {
    struct Coord: Hashable {
        let x: Int
        let y: Int

        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }

    @_optimize(speed)
    func numIslands(_ grid: [[Character]]) -> Int {
        var count = 0
        var visited: Set<Coord> = []

        @_optimize(speed)
        func bfs(_ i: Int, _ j: Int) {
            var queue = [(i, j)]

            while !queue.isEmpty {
                let (i, j) = queue.popLast()!
                if visited.contains(Coord(i, j)) { continue }
                visited.insert(Coord(i, j))

                for (a, b) in [(i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)] {
                    if min(a, b) < 0 || a >= grid.count || b >= grid[0].count { continue }

                    if grid[a][b] == "1" {
                        queue.append((a, b))
                    }
                }
            }
        }

        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "0" || visited.contains(Coord(i, j)) { continue }

                count += 1

                bfs(i, j)
            }
        }

        return count
    }
}
