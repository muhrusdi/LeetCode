import Foundation

func solutionLC8() {
    
    class Solution {
        func myAtoi(_ str: String) -> Int {
            var res: Float80 = 0.0
            let int_max: Float80 = 2147483647, int_min: Float80 = -2147483648
            var reachedEnd = false
            let chars = [Character](str.characters.reversed())
            let n = chars.count
            var i = 0, j = 0
            whileLabel: while i < n {
                let char = chars[i]
                switch char {
                case _ where reachedEnd:
                    if char != " " {
                        res = 0.0
                        j = i
                        i = i - 1
                        reachedEnd = false
                    }
                case "-":
                    res = -res
                    if res < int_min {
                        res = int_min
                        reachedEnd = true
                    }
                    reachedEnd = true
                case _ where "0" <= char && char <= "9":
                    res = res + Float80((pow(10.0, Double(i - j)) * Double(String(char))!))
                default:
                    if char != " " && char != "+" {
                        res = 0.0
                    }
                    reachedEnd = true
                }
                i = i + 1
            }
            return res > int_max ? Int(int_max) : Int(res)
        }
    }
    
}
