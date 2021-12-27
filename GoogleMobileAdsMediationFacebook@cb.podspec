Pod::Spec.new do |spec|
  spec.name         = 'GoogleMobileAdsMediationFacebook@cb'
  spec.version      = '6.9.0.0'
  spec.platform     = :ios, '10.0'
  spec.license      = { :type => 'Apache 2.0' }
  spec.homepage     = 'https://developers.google.com/admob/ios/mediation/facebook'
  spec.author       = 'Google Inc.'
  spec.summary      = 'Facebook adapter used for mediation with the Google Mobile Ads SDK'
  spec.source       = { :git => 'https://github.com/cardinalblue/googleads-mobile-ios-mediation.git', :branch => 'feat/m1-mac-support' }
  spec.vendored_frameworks = [
    "adapters/Facebook/Library/FacebookAdapter.xcframework"
  ]  
  spec.dependency "FBAudienceNetwork", '~> 6.9.0'
  spec.dependency "Google-Mobile-Ads-SDK", '~> 8.0'  
end