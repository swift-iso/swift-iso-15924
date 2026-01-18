// swift-tools-version:6.2

import PackageDescription

extension String {
    static let iso15924: Self = "ISO 15924"
}

extension String { var tests: Self { self + " Tests" } }

extension Target.Dependency {
    static var iso15924: Self { .target(name: .iso15924) }
    static var standards: Self { .product(name: "Standard Library Extensions", package: "swift-standard-library-extensions") }
    static var incits_4_1986: Self { .product(name: "ASCII", package: "swift-ascii") }
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
        .library(name: "ISO 15924", targets: ["ISO 15924"])
    ],
    dependencies: [
        .package(path: "../../swift-primitives/swift-standard-library-extensions"),
        .package(path: "../../swift-foundations/swift-ascii")
    ],
    targets: [
        .target(
            name: "ISO 15924",
            dependencies: [
                .standards,
                .incits_4_1986
            ],
            resources: [
                .copy("Resources")
    ]
        )
    ],
    swiftLanguageModes: [.v6]
)
