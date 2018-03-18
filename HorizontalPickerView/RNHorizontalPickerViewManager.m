//
//  RNHorizontalPickerManager.m
//  FlyStatistics
//
//  Created by zunyi on 2017/11/2.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "RNHorizontalPickerViewManager.h"
#import <React/UIView+React.h>
#import <React/RCTUIManager.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>
#import "HorizontalPickerViews.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface RNHorizontalPickerViewManager()<HorizontalPickerViewDelegate>
@property (nonatomic, strong) HorizontalPickerViews *hpv;
@end

@implementation RNHorizontalPickerViewManager

RCT_EXPORT_MODULE()
RCT_EXPORT_VIEW_PROPERTY(onItemClicked, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(values,NSArray);

- (UIView *)view
{
  _hpv = [[HorizontalPickerViews alloc]initWithFrame:CGRectMake((kScreenWidth - kScreenWidth*0.8)/2, 0, kScreenWidth*0.8, 50) isLoop:NO];
  _hpv.delegate = self;
  return _hpv;
}


#pragma mark <Delegate>
- (void)didSelectItem:(NSInteger)index view:(HorizontalPickerViews*)view
{
  if (!view.onItemClicked) {
    return;
  }
  view.onItemClicked(@{@"value": [NSNumber numberWithInteger:index]});
 
}

@end
