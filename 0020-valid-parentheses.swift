class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Int] = []

        for c in s {
            switch c {
            case "(": stack.append(0)
            case "{": stack.append(1)
            case "[": stack.append(2)
            case ")":
                guard stack.popLast() == 0 else { return false }
            case "}":
                guard stack.popLast() == 1 else { return false }
            case "]":
                guard stack.popLast() == 2 else { return false }
            default: break
            }
        }

        return stack.count == 0
    }
}
