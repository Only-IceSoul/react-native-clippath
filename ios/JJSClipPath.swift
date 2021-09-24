//
//  ClipPath.swift
//  ReactNativeClippath
//
//  Created by Juan J LF on 8/8/21.
//  Copyright © 2021 Facebook. All rights reserved.
//

import Foundation
import UIKit

@objc(JJSClipPath)
class JJSClipPath: RCTViewManager {

    override func view() -> UIView! {
       return ClipPathView()
     }
   override class func requiresMainQueueSetup() -> Bool {
        return true
    }
}
