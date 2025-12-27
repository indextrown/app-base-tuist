//
//  Workspace.swift
//  Config
//
//  Created by 김동현 on 12/27/25.
//

import ProjectDescription

let workspace = Workspace(
    name: "SwiftUIApp",
    projects: [
        "Project/App",
        "Project/Feature/*"
    ]
)

