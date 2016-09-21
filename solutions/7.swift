import Foundation

func solutionLC7() {
    
    class Solution {
        func reverse(_ x: Int) -> Int {
            if x < 0 {
                return -self.reverse(-x)
            }
            let res = Int(String(String(x).characters.reversed()))!
            if res < Int(Int32.min) || res > Int(Int32.max) {
                return 0
            }
            return res
        }
    }
    
}
