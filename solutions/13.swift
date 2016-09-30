import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        let digits = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        var num = 0, i = 0, s = s
        while s.characters.count > 0 {
            let symbol = symbols[i], digit = digits[i]
            if s.hasPrefix(symbol) {
                num = num + digit
                s = s.substring(from: s.index(s.startIndex, offsetBy: symbol.characters.count))
            } else {
                i = i + 1
            }
        }
        return num
    }
}
