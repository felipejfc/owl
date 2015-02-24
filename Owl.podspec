Pod::Spec.new do |s|
  s.name         = "Owl"
  s.version      = "1.0"
  s.summary      = "Secure Simple Key-Value Storage for iOS"
  s.license      = "MIT"
  s.author             = { "Felipe Cavalcanti" => "fjfcavalcanti@gmail.com" }
  s.source       = { :git => "https://github.com/felipejfc/owl.git" }
  s.ios.deployment_target = '5.0'
  s.source_files = "*.{h,m,c}"
  s.dependency 'JSONModel'
end
