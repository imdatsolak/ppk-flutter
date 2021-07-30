#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint ppk_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'ppk_flutter'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin to integrate the PDF-Library from PSPDFKit GmbH'
  s.description      = <<-DESC
A Flutter plugin to integrate the PDF-Library from PSPDFKit GmbH
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
