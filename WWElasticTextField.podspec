Pod::Spec.new do |s|
  s.name         = "WWElasticTextField"
  s.version      = "0.0.2"
  s.summary      = "UITextField with elastic bounce effect."
  s.description  = <<-DESC
                   UITextField with elastic bounce effect.
			A more interactable text field
                   Following the tutorial by Daniel Tavares on raywenderlich:
			https://www.raywenderlich.com/100939/how-to-create-an-elastic-animation-with-swift
                   DESC
  s.homepage     = "https://github.com/shuuchen/WWElasticTextField"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "shuchen" => "dushuchen97@gmail.com" }
  s.social_media_url   = "http://twitter.com/shuchen"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/shuuchen/WWElasticTextField.git", :tag => s.version.to_s }
  s.source_files  = "WWElasticTextField", "WWElasticTextField/**/*.{swift}"
  s.framework  = "UIKit"
  s.requires_arc = true
end
