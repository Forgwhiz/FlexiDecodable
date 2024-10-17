Pod::Spec.new do |s|
  s.name             = 'FlexiDecodable'
  s.version          = '0.0.4'
  s.summary          = 'A flexible Decodable implementation that supports type coercion with fallback'
  s.description      = 'FlexiDecodable is a flexible Swift package for decoding various types with fallback logic (String, Int, Float, etc.)'
  s.homepage         = 'https://github.com/Forgwhiz/FlexiDecodable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Forgwhiz' => 'mailtosathish05@gmail.com' }
  s.source           = { :git => 'https://github.com/Forgwhiz/FlexiDecodable', :tag => s.version.to_s }
  s.source_files     = 'Sources/**/*.{swift}'
  s.platform         = :ios, '10.0'
  s.swift_version    = '5.0'
  s.requires_arc     = true
end
