#
# Be sure to run `pod lib lint PBTinyAlert.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PBTinyAlert"
  s.version          = "0.1.0"
  s.summary          = "A short description of PBTinyAlert."
  s.homepage         = "https://github.com/mklb/PBTinyAlert"
  s.screenshots     = "https://raw.githubusercontent.com/mklb/PBTinyAlert/master/PBTinyAlert.gif"
  s.license          = 'MIT'
  s.author           = { "Patrick Bläsing" => "hallo@by-maikel.com" }
  s.source           = { :git => "https://github.com/mklb/PBTinyAlert.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/justawebguy'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'PBTinyAlert' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'

  s.frameworks = 'AudioToolbox'
  s.dependency 'pop', '~> 1.0'
end
