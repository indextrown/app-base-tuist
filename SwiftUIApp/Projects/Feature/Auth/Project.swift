import ProjectDescription

let project = Project(
    name: "Auth",
    targets: [

        // MARK: - Feature Framework
        .target(
            name: "Auth",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.auth",
            deploymentTargets: .iOS("17.0"),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: []
        ),

        // MARK: - Example App
//        .target(
//            name: "AuthExample",
//            destinations: .iOS,
//            product: .app,
//            bundleId: "com.example.auth.example",
//            deploymentTargets: .iOS("17.0"),
//            infoPlist: .extendingDefault(with: [
//                "UILaunchScreen": [:]
//            ]),
//            sources: ["Example/Sources/**"],
//            resources: ["Example/Resources/**"],
//            dependencies: [
//                .target(name: "Auth")
//            ]
//        )
    ]
)
