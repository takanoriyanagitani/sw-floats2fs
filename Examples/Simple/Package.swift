// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "Simple",
  dependencies: [
    .package(path: "../..")
  ],
  targets: [
    .executableTarget(
      name: "Simple",
      dependencies: [
        "FloatsToFileSystem"
      ]
    )
  ]
)
