import Foundation

func solution14() {
    
    class Solution {
        func longestCommonPrefix(_ strs: [String]) -> String {
            if strs.count == 0 {
                return ""
            }
            var minStr = strs[0]
            var minN = minStr.characters.count
            for str in strs {
                if str.characters.count < minN {
                    minStr = str
                    minN = minStr.characters.count
                }
            }
            if minN == 0 {
                return ""
            }
            var longest = ""
            var i = 0, j = minN - 1
            while i <= j {
                let k = (i + j) / 2
                let common = minStr.substring(to: minStr.index(minStr.startIndex, offsetBy: k + 1))
                var isCommon = true
                for str in strs {
                    if !str.hasPrefix(common) {
                        isCommon = false
                        break
                    }
                }
                if isCommon {
                    longest = common
                    i = k + 1
                } else {
                    j = k - 1
                }
            }
            return longest
        }
    }
    
}
