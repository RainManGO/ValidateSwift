#
# Be sure to run `pod lib lint ValidateSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ValidateSwift'
  s.version          = '0.2.0'
  s.summary          = 'A short description of ValidateSwift.'
  s.homepage         = 'https://github.com/RainManGO/ValidateSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZY' => '776210576@qq.com' }
  s.source           = { :git => 'https://github.com/RainManGO/ValidateSwift.git', :tag => s.version.to_s }
  s.swift_version = "4.2"
  s.platform     = :ios, "8.0"
  s.source_files = 'ValidateSwift/Classes/**/*'
end
