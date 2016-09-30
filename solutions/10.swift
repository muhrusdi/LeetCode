import Foundation

enum Token {
    case dot
    case character(String)
    indirect case star(Token)
}

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let rawTokens = self.tokenize(p)
        var tokens: [Token] = []
        forLabel: for (i, token) in rawTokens.enumerated() {
            if case let .star(repeated) = token {
                if i > 0 {
                    if case let .star(preRepeated) = rawTokens[i - 1] {
                        if case let .character(repeatedChar) = repeated {
                            if case let .character(preRepeatedChar) = preRepeated {
                                if repeatedChar == preRepeatedChar {
                                    continue forLabel
                                }
                            }
                        }
                        switch repeated {
                        case .dot:
                            switch preRepeated {
                            case .dot:
                                continue forLabel
                            default:
                                break
                            }
                        default:
                            break
                        }
                    }
                }
            }
            tokens.append(token)
        }
        return self.isMatch(s.characters.map({Token.character(String($0))}), tokens)
    }
    func isMatch(_ chars: [Token], _ tokens: [Token]) -> Bool {
        if chars.count == 0 {
            if tokens.count == 0 {
                return true
            } else {
                let token = tokens[0]
                switch token {
                case .star:
                    return self.isMatch(chars, Array(tokens[1..<tokens.count]))
                default:
                    return false
                }
            }
        }
        if tokens.count == 0 {
            return false
        }
        let token = tokens[0]
        if case let .character(char) = chars[0] {
            switch token {
            case .character(let expected):
                if char != expected {
                    return false
                } else {
                    return self.isMatch(Array(chars[1..<chars.count]), Array(tokens[1..<tokens.count]))
                }
            case .dot:
                return self.isMatch(Array(chars[1..<chars.count]), Array(tokens[1..<tokens.count]))
            default:
                var repeated = ""
                var isStar = false
                if case let .star(.character(repeatedCharacter)) = token {
                    repeated = repeatedCharacter
                } else {
                    isStar = true
                }
                var stop = 0
                for i in 0..<chars.count {
                    if case let .character(char) = chars[i] {
                        if isStar || char == repeated {
                            stop = stop + 1
                            continue
                        }
                    }
                    break
                }
                for i in (0...stop).reversed() {
                    if self.isMatch(Array(chars[i..<chars.count]), Array(tokens[1..<tokens.count])) {
                        return true
                    }
                }
                return false
            }
        }
        return false
    }
    func tokenize(_ s: String) -> [Token] {
        var tokens: [Token] = [], i = 0
        let chars = [String](s.characters.map({String($0)}))
        while i < chars.count {
            let curr = chars[i]
            let next = (i + 1 < chars.count) ? chars[i + 1] : ""
            let nextnext = (i + 2 < chars.count) ? chars[i + 2] : ""
            var token: Token
            if curr == "\\" {
                i = i + 1
                token = .character(next)
                if nextnext == "*" {
                    i = i + 1
                    token = .star(token)
                }
            } else {
                if curr == "." {
                    token = .dot
                } else {
                    token = .character(curr)
                }
                if next == "*" {
                    i = i + 1
                    token = .star(token)
                }
            }
            i = i + 1
            tokens.append(token)
        }
        return tokens
    }
}
