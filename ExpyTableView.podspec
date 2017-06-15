#
# Be sure to run `pod lib lint ExpyTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ExpyTableView'
  s.version          = '0.1.0'
  s.summary          = 'ExpyTableView lets you make your table view expandable with implementing one method.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC

ExpyTableView allows you to make your table view sections expandable just by implementing one data source method. Uses row insertion and deletion. You specify and return the expanding cell from this data source method and you are ready to go.
                       DESC

  s.homepage         = 'https://github.com/okhanokbay/ExpyTableView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'okhanokbay' => 'okhanokbay5@gmail.com' }
  s.source           = { :git => 'https://github.com/okhanokbay/ExpyTableView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ExpyTableView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ExpyTableView' => ['ExpyTableView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
	s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
