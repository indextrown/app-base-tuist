import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Creates a new feature module",
    attributes: [
        nameAttribute
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

