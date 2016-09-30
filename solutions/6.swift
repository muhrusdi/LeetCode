import Foundation

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows <= 1 {
            return s
        }
        let chars = [Character](s.characters)
        var rows = [[Character]](repeatElement([Character](), count: numRows))
        var row = -1, inc = 1
        for i in 0..<chars.count {
            row = row + inc
            if row < 0 {
                row = 1
                inc = 1
            } else if row >= rows.count {
                row = rows.count - 2
                inc = -1
            }
            rows[row].append(chars[i])
        }
        return rows.map({String($0)}).joined(separator: "")
    }
}
