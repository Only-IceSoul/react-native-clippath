//
//  enums.swift
//  ReactNativeClippath
//
//  Created by Juan J LF on 8/8/21.
//  Copyright © 2021 Facebook. All rights reserved.
//

import UIKit

enum ClipPathError: Error {
    case runtimeError(String)
    case IllegalStateException(String)
    case Exception(String)
    case IllegalArgumentException(String)
    case IndexOutOfBoundsException(String)
    case NullPointerException(String)
    case OperationCanceledException(String)
    case ParseException(String)
  
}

 public enum DrawableAxis {
    case x, y , z
}

public enum DrawableLineCap : String{
    case butt,
         round,
         square
    
    internal func toTarget() -> CAShapeLayerLineCap
    {
        return CAShapeLayerLineCap.init(rawValue: rawValue)
    }
}


public enum DrawableLineJoin : String{
    case bevel,
         miter,
         round
    
    internal func toTarget() -> CAShapeLayerLineJoin
    {
        return CAShapeLayerLineJoin.init(rawValue: rawValue)
    }
}
