class Solution {
    func removeInvalidParentheses(_ string: String) -> [String] {
        var output = Set<String>()

        @_optimize(speed)
        func helper(_ s: [Character], _ l: Int, _ r: Int, _ pars: [Character]) {
            var stack: Int = 0
            var (left, right) = (l, r)
            for i in r..<s.count {
                let char = s[i]
                right = i
                if char == pars[0] {
                    stack += 1
                } else if char == pars[1] {
                    stack -= 1
                }
                if stack < 0 { break }
            }

            if stack < 0 {
                while left<=right {
                    let char = s[left]
                    if char != pars[1] { left += 1;  continue }
                    if left > 0 && char == s[left-1] { left += 1; continue }

                    var substring = s
                    substring.remove(at:left)

                    helper(
                        substring,
                        left,
                        right,
                        pars
                    )
                    left += 1
                }
            } else if stack > 0 {
                helper(Array(s.reversed()), 0, 0, [")", "("])
            } else {
                let res = pars[0] == "(" ? s : Array(s.reversed())
                let stringRes = String(res)
                output.insert(stringRes)
            }
        }

        helper(Array(string), 0, 0, ["(",")"])

        return Array(output)
    }
}
