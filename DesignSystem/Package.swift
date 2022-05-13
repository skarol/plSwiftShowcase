// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [.iOS("13.0"), .macOS("10.15"), .tvOS("13.0"), .watchOS("8.0")],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
    ],
    dependencies: [
        .package(url: "git@github.com:skarol/DesignSystemUtils.git", branch: "plSwift"),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [.product(name: "DesignSystemUtils", package: "DesignSystemUtils")]),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]),
    ]
)
