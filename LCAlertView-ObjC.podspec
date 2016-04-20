
Pod::Spec.new do |s|

  s.name         = "LCAlertView-ObjC"
  s.version      = "1.0.1"
  s.summary      = "Using UIAlertView with Block! Support: http://LeoDev.me"
  s.homepage     = "https://github.com/iTofu/LCAlertView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Leo" => "devtip@163.com" }
  s.social_media_url = "http://LeoDev.me"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/iTofu/LCAlertView.git", :tag => s.version }
  s.source_files = "LCAlertView/*"
  s.requires_arc = true

end
