// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "URLNavigatorExt",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "URLNavigatorExt",
            targets: ["URLNavigatorExt"]),
    ],
    dependencies: [
        .package(url: "https://github.com/cdoky/URLNavigator.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "URLNavigatorExt",
            dependencies: ["URLNavigator"],
            path: "Sources/Classes"
        ),
    ]
)
