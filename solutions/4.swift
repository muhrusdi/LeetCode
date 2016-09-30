import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n1 = nums1.count, n2 = nums2.count, n = n1 + n2, t = n / 2 + 1
        var i1 = 0, i2 = 0, i = 0, pre = 0, now = 0
        while i < t {
            pre = now
            if i2 >= n2 || (i1 < n1 && nums1[i1] < nums2[i2]) {
                now = nums1[i1]
                i1 += 1
            } else {
                now = nums2[i2]
                i2 += 1
            }
            i += 1
        }
        if n % 2 == 0 {
            return (Double(pre) + Double(now)) / 2.0
        } else {
            return Double(now)
        }
    }
}
