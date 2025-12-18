import ProjectDescription

let project = Project(
    name: "Util",
    targets: [

        // MARK: - Feature Framework
        .target(
            name: "Util",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.util",
            deploymentTargets: .iOS("17.0"),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: []
        ),

        // MARK: - Example App
//        .target(
//            name: "UtilExample",
//            destinations: .iOS,
//            product: .app,
//            bundleId: "com.example.util.example",
//            deploymentTargets: .iOS("17.0"),
//            infoPlist: .extendingDefault(with: [
//                "UILaunchScreen": [:]
//            ]),
//            sources: ["Example/Sources/**"],
//            resources: ["Example/Resources/**"],
//            dependencies: [
//                .target(name: "Util")
//            ]
//        )
    ]
)
