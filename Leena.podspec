#
# Be sure to run `pod lib lint Leena.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Leena'
  s.version          = '0.1.1'
  s.summary          = 'Collection of class extensions'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'This library contains the useful collection of extensions'
                       DESC

  s.homepage         = 'https://github.com/rakeshios786/Leena'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rakesh Kumar Sharma' => 'rakeshios786@gmail.com' }
  s.source           = { :git => 'https://github.com/rakeshios786/Leena.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.requires_arc = true

  s.source_files = 'Leena/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Leena' => ['Leena/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'SwiftyJSON','5.0.0'
   s.dependency 'Kingfisher','4.10.1'
   s.dependency 'SwiftMessages','7.0.0'
   
end
