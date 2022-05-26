#
# Be sure to run `pod lib lint URLNavigatorExt.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'URLNavigatorExt'
  s.version          = '2.1.0'
  s.summary          = '使用注解自动生成Router以及Router相关参数'

  s.homepage         = 'https://github.com/cdoky/URLNavigatorExt'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'phil' => 'goo.gle@foxmail.com' }
  s.source           = { :git => 'https://github.com/cdoky/URLNavigatorExt.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version    = "5.0"
  
  s.source_files = 'Sources/Classes/**/*'
  
   s.dependency 'URLNavigator'
end
