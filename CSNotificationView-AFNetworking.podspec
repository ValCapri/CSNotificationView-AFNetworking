Pod::Spec.new do |s|
  s.name         = 'CSNotificationView-AFNetworking'
  s.version      = '0.1.0'
  s.summary      = "Drop-in, semi-translucent and blurring notification view."
  s.homepage     = "https://github.com/ValCapri/CSNotificationView-AFNetworking"
  s.license      = 'MIT'
  s.author       = {'Lionel Schinckus' => 'valcapri@me.com' }
  s.source       = { :git => 'https://github.com/ValCapri/CSNotificationView-AFNetworking.git', :tag => s.version.to_s }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.requires_arc = true
  s.source_files = '*.{h,m}'
  s.dependency "CSNotificationView", "~> 0.5"
  s.dependency "AFNetworking", "~> 3.0"
end
