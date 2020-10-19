// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "ExpyTableView",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ExpyTableView",
            targets: ["ExpyTableView"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ExpyTableView",
            dependencies: [],
            path: "ExpyTableView/Classes"
        )
    ],
    swiftLanguageVersions: [.v5]
)
