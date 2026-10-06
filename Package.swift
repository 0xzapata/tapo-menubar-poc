// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TapoMenubar",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://code.videolan.org/videolan/VLCKit.git", exact: "4.0.0-a25"),
    ],
    targets: [
        .executableTarget(
            name: "TapoMenubar",
            dependencies: [.product(name: "VLCKit", package: "VLCKit")],
            linkerSettings: [.linkedFramework("AppKit")]
        ),
    ]
)
