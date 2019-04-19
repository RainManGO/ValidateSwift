#
# Be sure to run `pod lib lint ValidateSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ValidateSwift'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ValidateSwift.'
  s.homepage         = 'https://github.com/776210576@qq.com/ValidateSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZY' => '776210576@qq.com' }
  s.source           = { :git => 'https://github.com/776210576@qq.com/ValidateSwift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'ValidateSwift/Classes/**/*'
end
