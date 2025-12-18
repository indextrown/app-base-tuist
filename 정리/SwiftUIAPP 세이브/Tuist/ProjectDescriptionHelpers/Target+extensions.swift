//
//  Target+extensions.swift
//  Config
//
//  Created by 김동현 on 12/18/25.
//

import Foundation
import ProjectDescription

fileprivate let commonScripts: [TargetScript] = [
  .pre(
    script: """
    ROOT_DIR=\(ProcessInfo.processInfo.environment["TUIST_ROOT_DIR"] ?? "")
    
    ${ROOT_DIR}/swiftlint --config ${ROOT_DIR}/.swiftlint.yml
    
    """,
    name: "SwiftLint",
    basedOnDependencyAnalysis: false
  )
]

extension Target {

  /// 우리 프로젝트에서 Target을 생성하는 공통 팩토리 메서드
  /// - 모든 Target은 이 메서드를 통해 생성하도록 강제
  /// - 공통 규칙(iOS 버전, SwiftLint 등)을 한 곳에서 관리
  public static func make(

    /// Xcode에 표시될 Target 이름
    name: String,

    /// 실행 가능한 플랫폼
    /// 기본값: iPhone
    destinations: Destinations = [.iPhone],

    /// 빌드 결과물 타입
    /// 예: .app, .staticFramework, .framework, .unitTests
    product: Product,

    /// 실제 생성될 바이너리 이름
    /// nil이면 name과 동일
    productName: String? = nil,

    /// 번들 식별자 (필수)
    /// 예: com.green.myapp
    bundleId: String,

    /// 최소 지원 OS 버전
    /// ⚠️ 현재는 파라미터로 받지만 아래에서 iOS 17.0으로 고정됨
    deploymentTargets: DeploymentTargets? = nil,

    /// Info.plist 설정
    /// 기본값: .default
    /// 필요 시 .extendingDefault(...)로 확장 가능
    infoPlist: InfoPlist? = .default,

    /// 빌드할 소스 파일 경로
    /// 예: ["Sources/**"]
    sources: SourceFilesList,

    /// 리소스 파일 (Assets, json, 이미지 등)
    resources: ResourceFileElements? = nil,

    /// Copy Files Build Phase 설정
    copyFiles: [CopyFilesAction]? = nil,

    /// C / Objective-C 헤더 설정
    headers: Headers? = nil,

    /// App Entitlements (Push, App Groups 등)
    entitlements: Entitlements? = nil,

    /// Target 전용 빌드 스크립트
    /// 공통 스크립트(SwiftLint)는 자동으로 합쳐짐
    scripts: [TargetScript] = [],

    /// 다른 Target / 외부 라이브러리 의존성
    dependencies: [TargetDependency] = [],

    /// Target 단위 Build Settings
    settings: Settings? = nil,

    /// CoreData 모델 설정
    coreDataModels: [CoreDataModel] = [],

    /// 앱 실행 시 환경 변수
    environmentVariables: [String: EnvironmentVariable] = [:],

    /// 앱 실행 시 전달할 런치 아규먼트
    launchArguments: [LaunchArgument] = [],

    /// 빌드 대상은 아니지만 프로젝트에 포함할 파일
    /// 예: README.md, scripts
    additionalFiles: [FileElement] = [],

    /// 커스텀 Build Rule
    buildRules: [BuildRule] = [],

    /// 병합 바이너리 설정 (iOS 17+)
    mergedBinaryType: MergedBinaryType = .disabled,

    /// 병합 가능한 타겟 여부
    mergeable: Bool = false

  ) -> Target {

    /// 실제 Tuist Target 생성
    return .target(

      /// Target 이름
      name: name,

      /// 실행 플랫폼
      destinations: destinations,

      /// 결과물 타입
      product: product,

      /// 바이너리 이름
      productName: productName,

      /// 번들 ID
      bundleId: bundleId,

      /// 최소 iOS 버전
      /// ⚠️ 모든 Target을 iOS 17.0으로 강제
      deploymentTargets: .iOS("17.0"),

      /// Info.plist 설정
      infoPlist: infoPlist,

      /// 소스 파일
      sources: sources,

      /// 리소스 파일
      resources: resources,

      /// Copy Files 설정
      copyFiles: copyFiles,

      /// 헤더 설정
      headers: headers,

      /// Entitlements
      entitlements: entitlements,

      /// 공통 스크립트 + 타겟별 스크립트
      /// 예: SwiftLint는 모든 Target에서 실행
      scripts: commonScripts + scripts,

      /// 의존성
      dependencies: dependencies,

      /// 빌드 설정
      settings: settings,

      /// CoreData 모델
      coreDataModels: coreDataModels,

      /// 실행 환경 변수
      environmentVariables: environmentVariables,

      /// 실행 인자
      launchArguments: launchArguments,

      /// 추가 파일
      additionalFiles: additionalFiles,

      /// 빌드 룰
      buildRules: buildRules,

      /// 병합 바이너리 타입
      mergedBinaryType: mergedBinaryType,

      /// 병합 가능 여부
      mergeable: mergeable
    )
  }
}
