
  Pod::Spec.new do |s|
    s.name = 'CapacitorAppRate'
    s.version = '0.0.1'
    s.summary = 'The AppRate plugin makes it easy to prompt the user to rate your app, either now, later, or never.'
    s.license = 'MIT'
    s.homepage = 'https://github.com/danielsogl/capacitor-app-rate.git'
    s.author = 'Daniel Sogl'
    s.source = { :git => 'https://github.com/danielsogl/capacitor-app-rate.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end