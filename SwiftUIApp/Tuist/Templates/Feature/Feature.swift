//
//  Feaature.swift
//  AppManifests
//
//  Created by 김동현 on 12/27/25.
//

import ProjectDescription

let template = Template(
    description: "Feature module with optional Example App",
    attributes: [
        .required("name"),
        .optional("withExample", default: "false")
    ],
    items: [

        // MARK: - Feature Module
        .file(
            path: "{{ name }}/Project.swift",
            templatePath: "Project.stencil"
        ),

        .file(
            path: "{{ name }}/Sources/{{ name }}.swift",
            templatePath: "Sources/Feature.stencil"
        ),
    ]
)
