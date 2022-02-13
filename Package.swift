// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "Web3swift",
    platforms: [
        .macOS(.v10_15), .iOS(.v11)
    ],
    products: [
        .library(name: "web3swift", targets: ["web3swift"])
    ],
    
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.3.0"),
        .package(url: "https://github.com/mxcl/PromiseKit.git", from: "6.16.2"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.4.2"),
        .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0" ..< "3.0.0"),
    ],
    targets: [
        .target(name: "secp256k1"),
        .target(
            name: "web3swift",
            dependencies: [
                .product(name: "BigInt", package: "BigInt"),
                "secp256k1",
                .product(name: "PromiseKit", package: "PromiseKit"),
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .product(name: "Crypto", package: "swift-crypto"),
                ]
        ),
    ]
)
