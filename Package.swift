// swift-tools-version:5.3
//
//  Package.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSCorePasswordStrengthWorker
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "DNSCorePasswordStrengthWorker",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "DNSCorePasswordStrengthWorker",
            type: .static,
            targets: ["DNSCorePasswordStrengthWorker"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/DoubleNode/DNSBlankWorkers.git", from: "1.9.2"),
        .package(url: "https://github.com/DoubleNode/DNSError.git", from: "1.8.0"),
        .package(url: "https://github.com/DoubleNode/DNSProtocols.git", from: "1.9.9"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "DNSCorePasswordStrengthWorker",
            dependencies: ["DNSBlankWorkers","DNSError","DNSProtocols"]),
        .testTarget(
            name: "DNSCorePasswordStrengthWorkerTests",
            dependencies: ["DNSCorePasswordStrengthWorker"]),
    ],
    swiftLanguageVersions: [.v5]
)
