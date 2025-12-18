//
//  Project.swift
//  Config
//
//  Created by 김동현 on 12/18/25.
//

import ProjectDescription

let project = Project(
    name: "App",
    targets: [

        // MARK: - App
        .target(
            name: "App",
            destinations: .iOS,
            product: .app,
            bundleId: "com.green.app",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(
                    target: "Feature",
                    path: "../Feature"
                )
            ]
        ),

        // MARK: - App Tests
        .target(
            name: "AppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.green.app.tests",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: "App")
            ]
        )
    ]
)
