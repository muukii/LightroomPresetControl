// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LightroomPreset",
  platforms: [
    .macOS(.v12),
    .iOS(.v16),
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "LightroomPreset",
      targets: ["LightroomPreset"]
    ),
    .executable(name: "lrpreset", targets: ["LightroomPresetCLI"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/yahoojapan/SwiftyXMLParser", from: "5.6.0"),
    .package(url: "https://github.com/muukii/Grain", branch: "main"),
    .package(url: "https://github.com/CoreOffice/XMLCoder", from: "0.14.0"),
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.0"),
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.6.1"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "LightroomPreset",
      dependencies: [
        "SwiftyXMLParser",
        .product(name: "GrainDescriptor", package: "Grain"),
        "XMLCoder",
        .product(name: "CustomDump", package: "swift-custom-dump")
      ]
    ),
    .executableTarget(
      name: "LightroomPresetCLI",
      dependencies: [
        "LightroomPreset", .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    ),
    .testTarget(
      name: "LightroomPresetTests",
      dependencies: ["LightroomPreset"]
    ),
  ]
)
