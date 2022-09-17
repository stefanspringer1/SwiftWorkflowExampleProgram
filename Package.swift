// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftWorkflowExampleProgram",
    platforms: [
        .macOS(.v10_15),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.3"),
        .package(url: "https://github.com/stefanspringer1/SwiftWorkflow", from: "0.0.106"),
        .package(url: "https://github.com/stefanspringer1/SwiftWorkflowExampleLibrary", from: "0.0.30"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "WorkflowExampleProgram",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Workflow", package: "SwiftWorkflow"),
                .product(name: "WorkflowExampleLibrary", package: "SwiftWorkflowExampleLibrary"),
            ]),
        .testTarget(
            name: "WorkflowExampleProgramTests",
            dependencies: ["WorkflowExampleProgram"]),
    ]
)
