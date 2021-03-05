//
//  GADRTBMaioRewardedAd.m
//  Adapter
//
//  Created by i-mobile on 2020/11/18.
//  Copyright © 2020 Google. All rights reserved.
//

#import "GADRTBMaioRewardedAd.h"
#import "GADMMaioConstants.h"

#import <MaioOB/MaioOB-Swift.h>

@interface GADRTBMaioRewardedAd () <MaioRewardedLoadCallback, MaioRewardedShowCallback>

@end

@implementation GADRTBMaioRewardedAd {
  GADMediationRewardedLoadCompletionHandler _completionHandler;
  __weak id<GADMediationRewardedAdEventDelegate> _adEventDelegate;
  MaioRewarded *_rewarded;
}

- (void)loadRewardedAdForAdConfiguration:(nonnull GADMediationRewardedAdConfiguration *)adConfiguration
                       completionHandler:(nonnull GADMediationRewardedLoadCompletionHandler)completionHandler {
  _completionHandler = completionHandler;

  MaioRequest *request = [[MaioRequest alloc] initWithZoneId:kGADRTBMaioAdapterZoneId testMode:adConfiguration.isTestRequest bidData:adConfiguration.bidResponse];
  _rewarded = [MaioRewarded loadAdWithRequest:request callback:self];
}

- (void)presentFromViewController:(nonnull UIViewController *)viewController {
  [_rewarded showWithViewContext:viewController callback:self];
}

#pragma mark - MaioRewardedLoadCallback, MaioRewardedShowCallback

- (void)didLoad:(MaioRewarded *)ad {
  _adEventDelegate = _completionHandler(self, nil);
}

- (void)didFail:(MaioRewarded *)ad errorCode:(NSInteger)errorCode {
  NSString *description = @"maio open-bidding SDK returned error";
  NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description, NSLocalizedFailureReasonErrorKey : description};
  NSError *error = [NSError errorWithDomain:kGADMMaioSDKErrorDomain code:errorCode userInfo:userInfo];

  if (10000 <= errorCode && errorCode < 20000) {
    // Fail to load.
    _completionHandler(nil, error);
  } else if (20000 <= errorCode && errorCode < 30000) {
    // Fail to show.
    [_adEventDelegate didFailToPresentWithError:error];
  } else {
    // Unknown error code
  }
}

- (void)didOpen:(MaioRewarded *)ad {
  [_adEventDelegate willPresentFullScreenView];
  [_adEventDelegate reportImpression];
  [_adEventDelegate didStartVideo];
}

- (void)didClose:(MaioRewarded *)ad {
  [_adEventDelegate didEndVideo];
  [_adEventDelegate willDismissFullScreenView];
  [_adEventDelegate didDismissFullScreenView];
}

- (void)didReward:(MaioRewarded *)ad reward:(RewardData *)reward {
  GADAdReward *gReward = [[GADAdReward alloc] initWithRewardType:reward.value rewardAmount:[NSDecimalNumber one]];

  [_adEventDelegate didRewardUserWithReward:gReward];
}

@end
