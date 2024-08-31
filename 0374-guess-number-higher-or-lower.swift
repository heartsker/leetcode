/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if num is higher than the picked number
 *                  1 if num is lower than the picked number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var l = 0, r = n + 1

        while l + 1 < r {
            let m = (l + r) / 2

            let g = guess(m)

            if g == -1 {
                r = m
            } else if g == 1 {
                l = m + 1
            } else {
                return m
            }
        }

        return l
    }
}
