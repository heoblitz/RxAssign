Pod::Spec.new do |s|
    s.name             = "RxAssign"
    s.version          = "1.1.0"
    s.summary          = "Support Combine Assign subscriber in RxSwift."
    s.homepage         = "https://github.com/heoblitz/RxAssign"
    s.license          = "MIT"
    s.author           = { "heoblitz" => "qndlf22@naver.com" }
    s.source           = { :git => "https://github.com/heoblitz/RxAssign.git", :tag => spec.version.to_s }
    s.source_files     = "Sources/RxAssign/*.swift"
    s.requires_arc     = true
    s.swift_version = "5.0"
    s.dependency "RxSwift", "~> 6.0"
    s.ios.deployment_target = "13.0"
    s.ios.deployment_target = "9.0"
    s.osx.deployment_target = "10.11"
    s.tvos.deployment_target = "9.0"
    s.watchos.deployment_target = "3.0"
  end