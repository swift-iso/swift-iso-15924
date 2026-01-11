// swift-tools-version:6.2

import PackageDescription

extension String {
    static let iso15924: Self = "ISO 15924"
}

extension String { var tests: Self { self + " Tests" } }

extension Target.Dependency {
    static var iso15924: Self { .target(name: .iso15924) }
    static var standards: Self { .product(name: "Standard Library Extensions", package: "swift-standard-library-extensions") }
    static var incits_4_1986: Self { .product(name: "INCITS 4 1986", package: "swift-incits-4-1986") }
    static var standardsTestSupport: Self { .product(name: "Test Primitives", package: "swift-test-primitives") }
}

let package = Package(
    name: "swift-iso-15924",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26)
    ],
    products: [
        .library(name: .iso15924, targets: [.iso15924]),
    ],
    dependencies: [
        .package(path: "../../swift-primitives/swift-standard-library-extensions"),
        .package(path: "../../swift-primitives/swift-test-primitives"),
        .package(path: "../swift-incits-4-1986")
    ],
    targets: [
        .target(
            name: .iso15924,
            dependencies: [
                .standards,
                .incits_4_1986
            ],
            resources: [
                .copy("Resources")
            ]
        ),
        .testTarget(
            name: .iso15924.tests,
            dependencies: [
                .iso15924,
                .incits_4_1986,
                .standardsTestSupport
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
