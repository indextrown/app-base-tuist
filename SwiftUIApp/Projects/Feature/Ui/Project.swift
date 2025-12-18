import ProjectDescription

let project = Project(
    name: "UI",
    targets: [

        // MARK: - Feature Framework
        .target(
            name: "UI",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.ui",
            deploymentTargets: .iOS("17.0"),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: []
        ),

        // MARK: - Example App
//        .target(
//            name: "UiExample",
//            destinations: .iOS,
//            product: .app,
//            bundleId: "com.example.ui.example",
//            deploymentTargets: .iOS("17.0"),
//            infoPlist: .extendingDefault(with: [
//                "UILaunchScreen": [:]
//            ]),
//            sources: ["Example/Sources/**"],
//            resources: ["Example/Resources/**"],
//            dependencies: [
//                .target(name: "Ui")
//            ]
//        )
    ]
)
