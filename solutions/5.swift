import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        let cs = [Character](s.characters)
        var longest = ""
        for i in 0..<cs.count {
            var j = i, k = i
            while 0 <= j && k < cs.count {
                if cs[j] != cs[k] {
                    break
                }
                j = j - 1
                k = k + 1
            }
            j = j + 1
            k = k - 1
            if k - j + 1 > longest.characters.count {
                longest = s[s.index(s.startIndex, offsetBy: j)...s.index(s.startIndex, offsetBy: k)]
            }
            j = i - 1
            k = i
            while 0 <= j && k < cs.count {
                if cs[j] != cs[k] {
                    break
                }
                j = j - 1
                k = k + 1
            }
            j = j + 1
            k = k - 1
            if k - j + 1 > longest.characters.count {
                longest = s[s.index(s.startIndex, offsetBy: j)...s.index(s.startIndex, offsetBy: k)]
            }
        }
        return longest
    }
}
