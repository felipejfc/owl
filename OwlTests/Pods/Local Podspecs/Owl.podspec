Pod::Spec.new do |s|
  s.name         = "Owl"
  s.version      = "1.1"
  s.summary      = "Secure Simple Key-Value Storage for iOS"
  s.license      = "MIT"
  s.author             = { "Felipe Cavalcanti" => "fjfcavalcanti@gmail.com" }
  s.source       = { :git => "https://github.com/felipejfc/owl.git", :tag => "#{s.version}"}
  s.ios.deployment_target = '5.0'
  s.source_files = "source/**/*.{h,m,c}"
  s.dependency 'RNCryptor'
  s.homepage = "https://github.com/felipejfc/owl"
  s.requires_arc = true
end
