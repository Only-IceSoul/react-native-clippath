//
//  ClipPath.m
//  ReactNativeClippath
//
//  Created by Juan J LF on 8/8/21.
//  Copyright © 2021 Facebook. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "React/RCTViewManager.h"
#import <React/RCTBridgeModule.h>
#import <UIKit/UIKit.h>


@interface
RCT_EXTERN_MODULE(JJSClipPath,RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(d, NSString)
RCT_EXPORT_VIEW_PROPERTY(viewBox, NSArray)
RCT_EXPORT_VIEW_PROPERTY(aspect, NSString)
RCT_EXPORT_VIEW_PROPERTY(align, NSString)

RCT_EXPORT_VIEW_PROPERTY(translateZ, NSNumber)

RCT_EXPORT_VIEW_PROPERTY(fillRule, NSString)

RCT_EXPORT_VIEW_PROPERTY(strokeWidth, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(strokeStart, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(strokeEnd, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(strokeCap, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeJoin, NSString)
RCT_EXPORT_VIEW_PROPERTY(strokeMiter, NSNumber)

RCT_EXPORT_VIEW_PROPERTY(transX, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(transY, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(transPercentageValue, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(rot, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(rotO, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(rotOx, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(rotOy, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(rotPercentageValue, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(sc, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(scX, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(scY, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(scO, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(scOx, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(scOy, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(scPercentageValue, NSNumber)
@end
