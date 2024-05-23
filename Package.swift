// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LifoContainers",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "LifoContainers",
            type: .static,
            targets: ["LifoContainers"]
        ),
    ],
    targets: [
        .target(
            name: "LifoContainers",
            path: "LifoContainers/LifoContainers/"
        ),
        .testTarget(
            name: "LifoContainersTests",
            dependencies: ["LifoContainers"],
            path: "LifoContainers/LifoContainersTests/"
        ),
    ]
)
