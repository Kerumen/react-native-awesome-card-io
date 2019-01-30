require 'json'
package = JSON.parse(File.read('package.json'))

Pod::Spec.new do |s|
  s.name             = "RNAwesomeCardIO"
  s.version          = package["version"]
  s.summary          = package["description"]
  s.requires_arc     = true
  s.license          = { :type => package["license"] }
  s.homepage         = package["homepage"]
  s.authors          = { package["author"]["name"] => package["author"]["email"] }
  s.source           = { :git => s.homepage, :tag => "v#{s.version}" }
  s.source_files     = ['ios/*.{h,m}', 'ios/CardIO/*.h']
  s.platform         = :ios, "8.0"
  s.frameworks       = 'Accelerate', 'AVFoundation', 'AudioToolbox', 'CoreMedia', 'CoreVideo', 'MobileCoreServices', 'OpenGLES', 'QuartzCore', 'Security', 'UIKit'
  s.libraries        = 'c++'
  s.vendored_libraries = 'ios/CardIO/libCardIO.a', 'ios/CardIO/libopencv_core.a', 'ios/CardIO/libopencv_imgproc.a'
  s.dependency          'React'
end
