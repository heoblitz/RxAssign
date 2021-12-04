Pod::Spec.new do |spec|
    spec.name             = "RxAssign"
    spec.version          = "1.1.0"
    spec.summary          = "Support Combine Assign subscriber in RxSwift."
    spec.homepage         = "https://github.com/heoblitz/RxAssign"
    spec.license          = "MIT"
    spec.author           = { "heoblitz" => "qndlf22@naver.com" }
    spec.source           = { :git => "https://github.com/heoblitz/RxAssign.git", :tag => spec.version.to_s }
    spec.source_files     = "Sources/RxAssign/*.swift"
    spec.requires_arc     = true
    spec.swift_version = "5.0"
    spec.ios.deployment_target = "13.0"
    spec.ios.deployment_target = "9.0"
    spec.osx.deployment_target = "10.11"
    spec.tvos.deployment_target = "9.0"
    spec.watchos.deployment_target = "3.0"
  end