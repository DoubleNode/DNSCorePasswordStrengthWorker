//
//  DNSCorePasswordStrengthCodeLocation.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCorePasswordStrengthWorker
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSError

public extension DNSCodeLocation {
    typealias passwordStrength = DNSCorePasswordStrengthCodeLocation
}
open class DNSCorePasswordStrengthCodeLocation: DNSCodeLocation {
    override open class var domainPreface: String { "com.doublenode.corePasswordStrength." }
}
