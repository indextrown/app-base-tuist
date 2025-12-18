//
//  Project+extensions.swift
//  Config
//
//  Created by 김동현 on 12/18/25.
//

import ProjectDescription

extension Project {
    public static func make(
        name: String,                                           // 프로젝트 이름 -> MyApp.xcodeproj
        organizationName: String? = nil,                        // 회사 / 조직 식별자
        options: [Options]? = nil,
        packages: [Package] = [],                               // Swift Package Manager 의존성 목록
        settings: Settings? = nil,                              // Swift Version/Code Signing
        targets: [Target] = [],                                 // 앱 / 프레임워크 / 테스트 타겟 정의
        schemes: [Scheme] = [],                                 // Xcode Scheme 정의
        fileHeaderTemplate: FileHeaderTemplate? = nil,          // 새 파일 생성 시 상단 주석 템플릿
        additionalFiles: [FileElement] = [],                    // 빌드 대상은 아니지만 프로젝트에 포함할 파일
        resourceSynthesizers: [ResourceSynthesizer] = .default  // Tuist의 리소스 코드 자동 생성
    ) -> Project {
        return Project(
            name: name,
            organizationName: "com.index",
            options: .options(
                automaticSchemesOptions: .disabled,
                defaultKnownRegions: ["ko"],
                developmentRegion: "ko",
                textSettings: .textSettings(usesTabs: false, indentWidth: 2, tabWidth: 2)
            ),
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes,
            fileHeaderTemplate: fileHeaderTemplate,
            additionalFiles: additionalFiles,
            resourceSynthesizers: resourceSynthesizers
        )
    }
}
