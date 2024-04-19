// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "FloatsToFileSystem",
  products: [
    .library(
      name: "FloatsToFileSystem",
      targets: ["FloatsToFileSystem"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")
  ],
  targets: [
    .target(
      name: "FloatsToFileSystem"),
    .testTarget(
      name: "FloatsToFileSystemTests",
      dependencies: ["FloatsToFileSystem"]),
  ]
)
