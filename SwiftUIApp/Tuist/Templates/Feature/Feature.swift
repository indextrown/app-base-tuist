//
//  Feature.swift
//  LoginManifests
//
//  Created by 김동현 on 12/19/25.
//

import ProjectDescription

let featureTemplate = Template(
    description: "Creates a new feature module",
    attributes: [
        .required("name")
    ],
    items: [
        .file(
            path: "{{ name | capitalize }}/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: "{{ name | capitalize }}/Sources/{{ name | capitalize }}.swift",
            templatePath: "Sources/Feature.stencil"
        )
    ]
)

