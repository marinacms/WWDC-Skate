// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "WWDC-Skate",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "WWDC-Skate",
            targets: ["AppModule"],
            bundleIdentifier: "marina-cristina.WWDC-Skate",
            teamIdentifier: "TJAAT2KASR",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .flower),
            accentColor: .presetColor(.cyan),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .process("Resources")
            ]
        )
    ]
)