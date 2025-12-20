import ProjectDescription

let project = Project(
    name: "HelloWorldApp",
    targets: [
        .target(
            name: "HelloWorldApp",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.HelloWorldApp",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "HelloWorldApp/Sources",
                "HelloWorldApp/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "HelloWorldAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.HelloWorldAppTests",
            infoPlist: .default,
            buildableFolders: [
                "HelloWorldApp/Tests"
            ],
            dependencies: [.target(name: "HelloWorldApp")]
        ),
    ]
)
