Pod::Spec.new do |s|
    s.name             = "RxAssign"
    s.version          = "1.1.0"
    s.summary          = "Support Combine Assign subscriber in RxSwift."
    s.homepage         = "https://github.com/heoblitz/RxAssign"
    s.license          = { :type => "MIT", :file => "LICENSE" }
    s.author           = { "heoblitz" => "qndlf22@naver.com" }
    s.source           = { :git => "https://github.com/heoblitz/RxAssign",
                           :tag => s.version.to_s }
    s.source_files = "Sources/**/*.{swift,h,m}"
    s.frameworks   = "Foundation"
    s.swift_version = "5.0"
    s.dependency "RxSwift", "~> 6.0"
    s.dependency "RxCocoa", "~> 6.0"

    s.ios.deployment_target = "9.0"
    s.osx.deployment_target = "10.11"
    s.tvos.deployment_target = "9.0"
    s.watchos.deployment_target = "3.0"
  end