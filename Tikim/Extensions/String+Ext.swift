//

import Foundation

extension String {
    
    func formatPhoneNumber(masks: PhoneMask) -> String {
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let mask = masks.rawValue
        
        var result = ""
        var startIndex = cleanNumber.startIndex
        let endIndex = cleanNumber.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "X" {
                result.append(cleanNumber[startIndex])
                startIndex = cleanNumber.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        
        return result
    }
    
    enum PhoneMask: String {
        case normal = "XX XXX XX XX"
        case profile = "(XX) XXX-XX-XX"
    }
}

