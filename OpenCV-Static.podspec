Pod::Spec.new do |s|
    s.name             = 'OpenCV-Static'
    s.version          = '4.5.1'
    s.summary          = 'OpenCV XCFramework'

    s.description      = <<-DESC
    OpenCV XCFramework for iOS, macOS and Mac Catalyst
    DESC

    s.homepage         = 'https://github.com/Rightpoint/opencv-swift'
    s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
    s.authors          = 'opencv.org'
    s.source           = { 
                            :git => 'https://github.com/Rightpoint/opencv-swift.git',
                            :tag => s.version.to_s, 
                            :submodules => true
                         }

    s.ios.deployment_target = "12.0"
    s.osx.deployment_target = "10.15"
    s.module_name = 'OpenCV'
    s.swift_versions = ['5.0']
    s.source_files = "opencv/modules/core/misc/objc/swift-package-manager/Sources/*.swift"
    s.vendored_frameworks = "opencv2.xcframework"
    s.requires_arc = true
    s.static_framework = true
    s.libraries = [ 'c++' ]
    s.ios.frameworks = [
        "Accelerate",
    ]
    s.osx.frameworks = [
        "Accelerate",
        "OpenCL",
        "AVFoundation",
        "CoreMedia",
    ]

    s.prepare_command = <<-CMD
        curl -O -L "https://github.com/Rightpoint/opencv/releases/download/#{s.version.to_s}/opencv2-#{s.version.to_s}-static.xcframework.zip"
        unzip -o opencv2-#{s.version.to_s}-static.xcframework.zip
        rm opencv2-#{s.version.to_s}-static.xcframework.zip
    CMD
end
