import Foundation

func solutionLC2() {
    
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    class Solution {
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            var l1 = l1, l2 = l2, res: ListNode?, curr: ListNode?, carry = 0
            while l1 != nil && l2 != nil {
                let a1 = l1!.val, a2 = l2!.val
                let l = ListNode((a1 + a2 + carry) % 10)
                carry = (a1 + a2 + carry) / 10
                if curr != nil {
                    curr!.next = l
                    curr = curr!.next
                } else {
                    res = l
                    curr = res
                }
                l1 = l1!.next
                l2 = l2!.next
            }
            while l1 != nil {
                let a1 = l1!.val, a2 = 0
                let l = ListNode((a1 + a2 + carry) % 10)
                carry = (a1 + a2 + carry) / 10
                if curr != nil {
                    curr!.next = l
                    curr = curr!.next
                } else {
                    res = l
                    curr = res
                }
                l1 = l1!.next
            }
            while l2 != nil {
                let a1 = 0, a2 = l2!.val
                let l = ListNode((a1 + a2 + carry) % 10)
                carry = (a1 + a2 + carry) / 10
                if curr != nil {
                    curr!.next = l
                    curr = curr!.next
                } else {
                    res = l
                    curr = res
                }
                l2 = l2!.next
            }
            if carry != 0 {
                let a1 = 0, a2 = 0
                let l = ListNode((a1 + a2 + carry) % 10)
                carry = (a1 + a2 + carry) / 10
                if curr != nil {
                    curr!.next = l
                    curr = curr!.next
                } else {
                    res = l
                    curr = res
                }
            }
            return res
        }
    }
    
}
