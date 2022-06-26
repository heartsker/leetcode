class Solution {

    func hash(_ c: Character) -> Int {
        Int(c.asciiValue!) * Int(c.asciiValue!)
    }

    func hash(_ s: [Character]) -> Int {
        s.reduce(0) {
            $0 + hash($1)
        }
    }

    func findSubstring(_ s: String, _ words: [String]) -> [Int] {

        if words.isEmpty {
            return []
        }

        let s = Array(s)
        let words = words.map({ Array($0) })
        let len = words.first!.count

        let wordsLen = words.count * len

        if s.count < wordsLen { return [] }

        let wordsHash = words.reduce(0, { $0 + hash($1) })

        var good: Set<[Character]> = []
        var bad: Set<[Character]> = []

        var res: [Int] = []
        var i = 0
        var stringHash = 0

        while i <= s.count - wordsLen {
            if i == 0 {
                stringHash = hash(Array(s[i..<i+wordsLen]))
            } else {
                stringHash += hash(s[i + wordsLen - 1]) - hash(s[i - 1])
            }
            if wordsHash == stringHash {
                let subString = Array(s[i..<i + wordsLen])
                if bad.contains(subString) {
                    i += 1
                    continue
                }
                if good.contains(subString) {
                    res.append(i)
                    i += 1
                    continue
                }
                var ok = true
                var copy = words
                for j in 0 ..< words.count {
                    let word = Array(s[(i + j * len) ..< (i + (j + 1) * len)])
                    if !copy.contains(word) {
                        ok = false
                        break
                    } else {
                        let index = copy.firstIndex(of: word)!
                        copy.remove(at: index)
                    }
                }
                if ok {
                    res.append(i)
                    good.insert(subString)
                } else {
                    bad.insert(subString)
                }
            }
            i += 1
        }
        return res
    }
}