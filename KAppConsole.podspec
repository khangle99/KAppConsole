#
# Be sure to run `pod lib lint KAppConsole.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KAppConsole'
  s.version          = '0.1.3'
  s.summary          = 'A in app terminal logging view'
  s.swift_version    = '5'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A in app terminal logging view, useful for debugging with launch option: wait for executable to be launch.
                       DESC

  s.homepage         = 'https://github.com/khangle99/KAppConsole'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KhangLD9' => 'khangld9@fpt.com.vn' }
  s.source           = { :git => 'https://github.com/khangle99/KAppConsole.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'KAppConsole/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KAppConsole' => ['KAppConsole/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
