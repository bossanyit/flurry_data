#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flurry_data.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flurry_data'
  s.version          = '0.0.1'
  s.summary          = 'A Null-Safe Flutter plugin to use Flurry Analytics.'
  s.description      = <<-DESC
  A Null-Safe Flutter plugin to use Flurry Analytics. The plugin logs sessions, event logging, UserId.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'Flurry-iOS-SDK/FlurrySDK'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
