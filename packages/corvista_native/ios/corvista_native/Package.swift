// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "corvista_native",
    platforms: [.iOS("17.0")],
    products: [.library(name: "corvista-native", targets: ["corvista_native"])],
    dependencies: [.package(name: "FlutterFramework", path: "../FlutterFramework")],
    targets: [
        .target(
            name: "corvista_native",
            dependencies: [.product(name: "FlutterFramework", package: "FlutterFramework")],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
                .copy("Resources/Models"),
            ]
        )
    ]
)
