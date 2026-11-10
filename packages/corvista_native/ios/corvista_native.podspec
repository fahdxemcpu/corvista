Pod::Spec.new do |s|
  s.name             = 'corvista_native'
  s.version          = '0.1.0'
  s.summary          = 'Corvista native iOS engine.'
  s.description      = 'Camera, Core ML inference, recording, MapKit, sensors, speech and Live Activities for Corvista.'
  s.homepage         = 'https://corvista.app'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Corvista' => 'support@corvista.app' }
  s.source           = { :path => '.' }
  s.source_files     = 'corvista_native/Sources/corvista_native/**/*.swift'
  s.resource_bundles = {
    'corvista_native_models' => ['corvista_native/Sources/corvista_native/Resources/Models/*.mlmodelc'],
    'corvista_native_privacy' => ['corvista_native/Sources/corvista_native/PrivacyInfo.xcprivacy'],
  }
  s.dependency 'Flutter'
  s.platform = :ios, '17.0'
  s.frameworks = 'AVFoundation', 'CoreML', 'Vision', 'CoreMotion', 'CoreLocation', 'MapKit',
                 'Speech', 'WeatherKit', 'ContactsUI', 'MessageUI', 'CoreImage', 'Accelerate',
                 'ActivityKit', 'Photos'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.9'
end
