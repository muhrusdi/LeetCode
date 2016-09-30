import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var max = 0, i = 0, j = height.count - 1
        while i < j {
            let size = (j - i) * min(height[i], height[j])
            if size > max {
                max = size
            }
            if height[i] < height[j] {
                i = i + 1
            } else {
                j = j - 1
            }
        }
        return max
    }
}
