// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftToolkit",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "SwiftToolkit",
            targets: ["SwiftToolkit"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftToolkit",
            path: "Sources/SwiftToolkit"
        ),
        .testTarget(
            name: "SwiftToolkitTests",
            dependencies: ["SwiftToolkit"],
            path: "Tests/SwiftToolkitTests"
        ),
    ]
)
