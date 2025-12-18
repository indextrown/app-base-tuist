import ProjectDescription

let project = Project(
    name: "App",
    targets: [
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "com.example.app",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen": [:]
            ]),
            sources: ["Sources/**"],
            dependencies: [
                .project(
                    target: "Auth",
                    path: "../Feature/Auth"
                ),
                .project(
                    target: "Core",
                    path: "../Feature/Core"
                ),
                .project(
                    target: "Util",
                    path: "../Feature/Util"
                )
            ]
        )
    ]
)
