//
//  App.swift
//  LoginManifests
//
//  Created by 김동현 on 12/19/25.
//

import ProjectDescription

//let nameAttribute: Template.Attribute = .required("name")

let appTemplate = Template(
    description: "Creates an App module",
    attributes: [
        .required("name")
    ],
    items: [
        .file(
            path: "{{ name }}/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: "{{ name }}/Sources/{{ name }}App.swift",
            templatePath: "Sources/App.stencil"
        )
    ]
)
