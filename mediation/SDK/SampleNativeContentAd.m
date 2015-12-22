//
// Copyright (C) 2015 Google, Inc.
//
// SampleNativeContentAd.m
// Sample Ad Network SDK
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "SampleNativeContentAd.h"

@implementation SampleNativeContentAd

- (void)handleClickOnView:(UIView *)view {
  NSLog(@"A click occurred on a SampleNativeContentAd!");
  // In a real SDK, some type of click action (such as the opening of a destination URL in an
  // external browser) would likely be initiated here.
}

- (void)recordImpression {
  NSLog(@"An impression was recorded for a SampleNativeContentAd!");
  // In a real SDK, some work would be done here to record the impression.
}

@end
