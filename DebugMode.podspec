Pod::Spec.new do |s|
  s.name             = 'DebugMode'
  s.version          = '0.1.0'
  s.summary          = 'Enter in debug mode by shaking your device'

  s.description      = <<-DESC
      Shake you device and enter in debug mode
                       DESC

  s.homepage         = 'https://github.com/XoddX/DebugMode'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PASQUIER Esteban' => 'pasquier.esteban@gmail.com' }
  s.source           = { :git => 'https://github.com/XoddX/DebugMode.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'DebugMode/Classes/**/*'

  s.framework = 'UIKit', 'Foundation'
  s.dependency 'FLEX'
  
end
