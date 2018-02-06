Pod::Spec.new do |s|
  s.name             = 'HolidayJp'
  s.version          = '0.1.0'
  s.summary          = 'Japanese holiday for Swift'
  s.homepage         = 'https://github.com/pine/holiday_jp-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pine Mizune' => 'pinemz@gmail.com' }
  s.source           = { :git => 'https://github.com/pine/holiday_jp-swift.git', :tag => s.version.to_s }
  s.source_files     = 'Sources/**/*'
end

# vim: se sw=2 ts=2 sts=2 et ft=ruby :
