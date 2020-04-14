#
# Be sure to run `pod lib lint ExpyTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ExpyTableView'
  s.version          = '1.2.1'
  s.swift_version    = '5.0'
  s.summary          = 'ExpyTableView lets you make your table view expandable with implementing one method.'
  s.description      = <<-DESC

ExpyTableView allows you to make your table view sections expandable just by implementing one data source method. Uses row insertion and deletion. You specify and return the expanding cell from this data source method and you are ready to go.
                       DESC

  s.homepage         = 'https://github.com/okhanokbay/ExpyTableView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'okhanokbay' => 'okhanokbay5@gmail.com' }
  s.source           = { :git => 'https://github.com/okhanokbay/ExpyTableView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'ExpyTableView/Classes/**/*'
  s.frameworks = 'UIKit'
end
