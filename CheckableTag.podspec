Pod::Spec.new do |spec|
  spec.name           = "CheckableTag"
  spec.version        = "0.1.0"
  spec.summary        = "generate tag"
  spec.homepage       = "https://github.com/airy-swift/CheckableTag"
  spec.license        = { :type => 'MIT', :file => 'LICENSE' }
  spec.author         = "airy-swift"
  spec.platform       = :ios, "13.0"
  spec.swift_version  = "5.1"
  spec.source         = { :git => "https://github.com/airy-swift/CheckableTag.git", :tag => "#{spec.version}" }
  spec.source_files   = "CheckableTag/**/*.swift"
end