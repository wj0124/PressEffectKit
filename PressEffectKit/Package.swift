// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PressEffectKit",
    platforms: [
        .iOS(.v13),       // ✅ SwiftUI 从 iOS 13 开始可用
        .macOS(.v10_15)   // ✅ Color 从 macOS 10.15 开始可用
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PressEffectKit",
            targets: ["PressEffectKit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PressEffectKit"),

    ]
)
