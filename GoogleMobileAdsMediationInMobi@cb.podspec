Pod::Spec.new do |spec|
  spec.name         = 'GoogleMobileAdsMediationInMobi@cb'
  spec.version      = '10.0.1.0'
  spec.platform     = :ios, '10.0'
  spec.license      = { :type => 'Apache 2.0' }
  spec.homepage     = 'https://developers.google.com/admob/ios/mediation/inmobi'
  spec.author       = 'Google Inc.'
  spec.summary      = 'InMobi adapter used for mediation with the Google Mobile Ads SDK'
  spec.source       = { :git => 'https://github.com/cardinalblue/googleads-mobile-ios-mediation.git', :branch => 'feat/m1-mac-support' }
  spec.vendored_frameworks = [
    "adapters/InMobi/Library/InMobiAdapter.xcframework"
  ]  
  spec.dependency "InMobiSDK/Core", '10.0.1'
  spec.dependency "Google-Mobile-Ads-SDK", '~> 8.0'  
end