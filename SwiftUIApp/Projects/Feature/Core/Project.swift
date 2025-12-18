import ProjectDescription

let project = Project(
    name: "Core",
    targets: [

        // MARK: - Feature Framework
        .target(
            name: "Core",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.core",
            deploymentTargets: .iOS("17.0"),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(
                    target: "UI",
                    path: "../UI"
                )
            ]
        ),

        // MARK: - Example App
//        .target(
//            name: "CoreExample",
//            destinations: .iOS,
//            product: .app,
//            bundleId: "com.example.core.example",
//            deploymentTargets: .iOS("17.0"),
//            infoPlist: .extendingDefault(with: [
//                "UILaunchScreen": [:]
//            ]),
//            sources: ["Example/Sources/**"],
//            resources: ["Example/Resources/**"],
//            dependencies: [
//                .target(name: "Core")
//            ]
//        )
    ]
)
