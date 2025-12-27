import ProjectDescription

let project = Project(
    name: "SwiftUIApp",
    targets: [
        .target(
            name: "SwiftUIApp",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.SwiftUIApp",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "SwiftUIApp/Sources",
                "SwiftUIApp/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "SwiftUIAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.SwiftUIAppTests",
            infoPlist: .default,
            buildableFolders: [
                "SwiftUIApp/Tests"
            ],
            dependencies: [.target(name: "SwiftUIApp")]
        ),
    ]
)
