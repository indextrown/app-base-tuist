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
                "Project/HelloWorldApp/Sources",
                "Project/HelloWorldApp/Resources",
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
                "Project/HelloWorldApp/Tests"
            ],
            dependencies: [.target(name: "HelloWorldApp")]
        ),
    ]
)
