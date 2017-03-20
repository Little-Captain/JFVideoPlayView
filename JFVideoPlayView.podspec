#
# Be sure to run `pod lib lint JFVideoPlayView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JFVideoPlayView'
  s.version          = '0.1.0'
  s.summary          = 'JFVideoPlayView 是一款方便好用的视频播放器'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
JFVideoPlayView 是一款方便好用的视频播放器, 它支持全屏和非全屏. 使用方便
                       DESC

  s.homepage         = 'http://git.oschina.net/Little-Captain/JFVideoPlayView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Little-Captain' => 'littlecaptain@foxmail.com' }
  s.source           = { :git => 'git@git.oschina.net:Little-Captain/JFVideoPlayView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'JFVideoPlayView/Classes/**/*'
  s.resource = 'JFVideoPlayView/Assets/JFVideoPlayView.bundle'
  s.dependency 'Masonry'
end
