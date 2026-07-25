# swift-iso-15924

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The four-letter script codes of ISO 15924.

## Standard Reference

- **ISO**: 15924
- **Title**: Codes for the representation of names of scripts

## Installation

Add the package to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/swift-iso/swift-iso-15924.git", from: "0.1.4")
]
```

Add the product to a target that needs it:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "ISO 15924", package: "swift-iso-15924")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
