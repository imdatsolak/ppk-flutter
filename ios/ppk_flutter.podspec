#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint ppk_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'ppk_flutter'
  s.version          = '1.0.0'
  s.summary          = 'A Flutter plugin to integrate the PDF-Library from PSPDFKit GmbH'
  s.description      = <<-DESC
A Flutter plugin to integrate the PDF-Library from PSPDFKit GmbH
                       DESC
  s.homepage         = 'https://github.com/imdatsolak/ppk-flutter'
  s.license          = { :file => '../LICENSE.txt' }
  s.author           = { 'Imdat Solak' => 'imdat@solak.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'PSPDFKit'
  s.platform = :ios, '13.0'
  s.ios.deployment_target = '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
