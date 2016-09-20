import Foundation

func solutionLT3() {
    
    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            let cs = [Character](s.characters)
            if cs.count == 0 {
                return 0
            }
            var begin = 0, end = 0, max = 1
            while begin < cs.count {
                var newBegin = end + 1
                var valid = true
                while end + 1 < cs.count {
                    end = end + 1
                    let c = cs[end]
                    for i in begin..<end {
                        if c == cs[i] {
                            valid = false
                            newBegin = i + 1
                            break
                        }
                    }
                    if !valid {
                        break
                    }
                }
                var newMax = end - begin
                if valid {
                    newMax = end - begin + 1
                }
                if newMax > max {
                    max = newMax
                }
                begin = newBegin
            }
            return max
        }
    }
    
}
