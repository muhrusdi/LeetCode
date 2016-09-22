import Foundation

func solutionLC12() {
    
    class Solution {
        func intToRoman(_ num: Int) -> String {
            let digits = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
            let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
            var roman = ""
            var num = num, i = 0
            while num > 0 {
                let digit = digits[i], symbol = symbols[i]
                if num >= digit {
                    num = num - digit
                    roman = roman + symbol
                } else {
                    i = i + 1
                }
            }
            return roman
        }
    }
    
}
