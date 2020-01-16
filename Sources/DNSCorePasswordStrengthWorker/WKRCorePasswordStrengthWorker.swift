//
//  WKRCorePasswordStrengthWorker.swift
//  DoubleNode Core - DNSCorePasswordStrengthWorker
//
//  Created by Darren Ehlers on 2019/08/12.
//  Copyright © 2019 - 2016 Darren Ehlers and DoubleNode, LLC. All rights reserved.
//

import DNSBlankWorkers
import DNSProtocols
import Foundation

open class WKRCorePasswordStrengthWorker: WKRBlankPasswordStrengthWorker
{
    public var minimunLength = 6
    
    let regexOneUppercase = "^(?=.*[A-Z]).*$"
    let regexOneLowercase = "^(?=.*[a-z]).*$"
    let regexOneNumber = "^(?=.*[0-9]).*$"
    let regexOneSymbol = "^(?=.*[!@#$%&_]).*$"

    // MARK: - Business Logic / Single Item CRUD

    override open func doCheckPasswordStrength(for password: String) throws -> PTCLPasswordStrengthType {
        let len = password.count
        var strength = 0
        
        if len > 0 { strength += 1 }
        if len >= self.minimumLength { strength += 1 }
        if len >= 10 { strength += 1 }

        if self.utilityValidate(string: password, with: regexOneUppercase, caseSensitive: true) > 0 { strength += 1 }
        if self.utilityValidate(string: password, with: regexOneLowercase, caseSensitive: true) > 0 { strength += 1 }
        if self.utilityValidate(string: password, with: regexOneNumber, caseSensitive: true) > 0 { strength += 1 }
        if self.utilityValidate(string: password, with: regexOneSymbol, caseSensitive: true) > 0 { strength += 1 }
        
        switch strength {
        case ..<4: return .weak
        case 4..<6: return .moderate
        default: return .strong
        }
    }
    
    // MARK: - Utility methods

    func utilityValidate(string: String,
                         with pattern: String,
                         caseSensitive: Bool) -> Int {
        do {
            let regex = try NSRegularExpression.init(pattern: pattern, options: (caseSensitive ? [] : .caseInsensitive))
            return regex.numberOfMatches(in: string, options: .reportCompletion, range: NSMakeRange(0, string.count))
        } catch {
            print("RegEx Creation Failed")
            return 0
        }
    }
}
