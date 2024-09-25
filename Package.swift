// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "stylish",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(name: "Stylish", targets: ["Stylish"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(name: "Stylish", dependencies: [
            
        ]),
        .testTarget(name: "StylishTests", dependencies: [
            .target(name: "Stylish"),
        ]),
    ]
)


