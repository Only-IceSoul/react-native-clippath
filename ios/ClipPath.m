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
RCT_EXTERN_MODULE(ClipPath,RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(path, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(pathRotation, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(pathScale, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(pathTranslation, NSDictionary)

@end
