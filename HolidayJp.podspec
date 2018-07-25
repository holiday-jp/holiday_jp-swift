Pod::Spec.new do |s|
  s.name             = 'HolidayJp'
  s.version          = '0.2.1'
  s.summary          = 'Japanese holiday for Swift'
  s.homepage         = 'https://github.com/holiday-jp/holiday_jp-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pine Mizune' => 'pinemz@gmail.com' }
  s.source           = { :git => 'https://github.com/holiday-jp/holiday_jp-swift.git', :tag => s.version.to_s }
  s.source_files     = 'Sources/**/*'

  s.requires_arc              = true
  s.osx.deployment_target     = '10.9'
  s.ios.deployment_target     = '8.0'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target    = '9.0'
  s.pod_target_xcconfig       =  {
    'SWIFT_VERSION' => '4.1',
  }
end

# vim: se sw=2 ts=2 sts=2 et ft=ruby :
