//
//  {{ name }}App.swift
//  {{ name }}
//
//  Created by {{ author }} on {{ now | date:"yyyy-MM-dd" }}.
//

import ProjectDescription

let appTemplate = Template(
    // 이 템플릿의 설명 (tuist scaffold 시 표시됨)
    description: "Creates an App module",
    
    // 사용자에게 입력받을 값들
    // 예: --name MyApp
    attributes: [
        .required("name")
    ],
    
    // 실제로 생성될 파일들 정의
    items: [
        // 1. Project.swift
        .file(
            // 생성될 파일 경로
            // 예: MyApp/Project.swift
            path: "{{ name }}/Project.swift",
            
            // 사용할 템플릿 파일
            // Tuist/Templates/App/Project.stencil
            templatePath: "Project.stencil"
        ),
        
        // 2. App엔트리 파일 생성
        .file(
            // 예: MyApp/Sources/MyAppApp.swift
            path: "{{ name }}/Sources/{{ name }}App.swift",
            templatePath: "Sources/App.stencil"
        ),
        
        // 3. ContentView 생성
        .file(
            // 예: MyApp/Sources/ContentView.swift
            path: "{{ name }}/Sources/ContentView.swift",
            templatePath: "Sources/ContentView.stencil"
        ),
        
        // 4 Xcode처럼 Assets.xcassets 통째로 복사해서 생성
        .directory(
            path: "{{ name }}/Resources/",
            sourcePath: "Assets.xcassets"
        )
    ]
)
