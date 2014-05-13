Pod::Spec.new do |s|
  s.name             = "KPCameraButtonClone"
  s.version          = "0.1.0"
  s.summary          = "Reimplemnetation of Apple's Camera.app multi-use shutter button"
  s.homepage         = "http://EXAMPLE/NAME"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Eric Mika" => "ermika@gmail.com" }
  s.source           = { :git => "http://EXAMPLE/NAME.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kitschpatrol'
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  s.source_files = 'Classes'
end
