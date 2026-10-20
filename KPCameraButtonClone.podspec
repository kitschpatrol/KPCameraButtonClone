Pod::Spec.new do |s|
  s.name             = "KPCameraButtonClone"
  s.version          = "0.1.0"
  s.summary          = "Slavish reimplementation of the shape-morphing shutter button in Camera.app."
  s.homepage         = "https://github.com/kitschpatrol/KPCameraButtonClone"
  s.license          = 'MIT'
  s.author           = { "Eric Mika" => "eric@ericmika.com" }
  s.source           = { :git => "https://github.com/kitschpatrol/KPCameraButtonClone.git", :tag => "v#{s.version}" }
  s.social_media_url = 'https://twitter.com/kitschpatrol'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Classes'
end
