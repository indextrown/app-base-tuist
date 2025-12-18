/**
 [Project.swift]
 - Xcode 프로젝트 설계 (번들 ID, Info.plist, 타겟 등등)과 패키지, 외부 라이브러리 의존성 관리, 빌드 설정 등을 Swift 코드로 할 수 있다.
 - 협업시에는 원격저장소에서 이 파일을 받아오고 tuist generate 명령어를 통해 실제 Xcode 프로젝트 파일(.xcodeproj)을 만들어준다.
 
 
 [ProjectDescription]
 Tuist가 제공하는 DSL(Domain Specific Language)을 사용하기 위한 import
 - Project, Target, .app, .unitTests 같은 타입들이 여기 정의됨
 - Xcode 코드가 아님 → Tuist 전용
 */
import ProjectDescription

/**
 생성 결과물
 -  SwiftUIAPP.xcodeproj
 - SwiftUIAPP.xcworkspace
 */
let project = Project(
    name: "SwiftUIAPP",
    
    /**
     이 프로젝트에 포함될 타겟 목록
     → 여기서는 앱 타겟 1개 + 테스트 타겟 1개
     */
    targets: [
        // App
        .target(
            name: "SwiftUIAPP",
            destinations: .iOS,                 // 실행 가능한 플랫폼
            product: .app,                      // 빌드 결과물 타입 .framework / .staticFramework / .unitTests / uiTests
            bundleId: "dev.tuist.SwiftUIAPP",   // 앱의 고유 식별자
            infoPlist: .extendingDefault(       // 기본 Info.plist + 추가 설정
                with: [
                    /**
                     Launch Screen 설정
                     - SwiftUI에서는 보통 비워둬도 문제 없음
                     - 실제 화면은 LaunchScreen.storyboard 또는 SwiftUI splash로 처리
                     - 아예 필요 없으면 이렇게도 가능 infoPlist: .default
                     */
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            /**
             이 폴더들을 하나의 타겟 소스로 인식
             Tuist가 자동으로 Swift 파일 -> Sources
             Assets / json / images -> Resources
             */
            buildableFolders: [
                "SwiftUIAPP/Sources/**",
                "SwiftUIAPP/Resources/**",
            ],
            /**
             이 타겟이 의존하는 다른 타겟 / 프레임워크
             */
            dependencies: []
        ),
        // Test
        .target(
            name: "SwiftUIAPPTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.SwiftUIAPPTests",
            infoPlist: .default,
            buildableFolders: [
                "SwiftUIAPP/Tests"
            ],
            dependencies: [.target(name: "SwiftUIAPP")]
        ),
    ]
)
