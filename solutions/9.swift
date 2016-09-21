import Foundation

func solutionLC9() {
    
    class Solution {
        func isPalindrome(_ x: Int) -> Bool {
            if x < 0 {
                return false
            }
            var x = x
            let original = x
            var reversed = 0
            while x > 0 {
                reversed = reversed * 10 + x % 10
                x = x / 10
            }
            return original == reversed
        }
    }
    
}
