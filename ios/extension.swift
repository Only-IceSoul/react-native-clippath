//
//  extension.swift
//  ReactNativeClippath
//
//  Created by Juan J LF on 8/8/21.
//  Copyright © 2021 Facebook. All rights reserved.
//

import UIKit

extension UIBezierPath {
    

    func addRect(_ r:CGRect?){
        guard let rect = r else { return }
        let l = rect.origin.x
        let r = rect.origin.x + rect.width
        let b = rect.origin.y + rect.height
        let t = rect.origin.y
        move(to: CGPoint(x: l, y: t))
        addLine(to: CGPoint(x: r, y: t))
        addLine(to: CGPoint(x: r , y: b))
        addLine(to: CGPoint(x: l, y: b ))
        addLine(to:CGPoint(x: l, y: t))
        close()
    }
    
    func addRoundRect(_ r:CGRect?,radius:[CGFloat]){
        guard let rect = r else { return }
        var rtl = radius[0]
        var rtr = radius[1]
        var rbl = radius[2]
        var rbr = radius[3]
        
        var maxValue = max(rtl + rtr, rbl + rbr)
        maxValue = max(rtl + rbl, rtr + rbr)
        
        if(maxValue > rect.height || maxValue > rect.width){
            let size = min(rect.height, rect.width)
            rtl = (radius[0] / maxValue ) * size
            rtr = (radius[1] / maxValue ) * size
            rbl = (radius[2] / maxValue ) * size
            rbr = (radius[3] / maxValue ) * size
        }
        
        

        let l = rect.origin.x
        let r = rect.origin.x + rect.width
        let b = rect.origin.y + rect.height
        let t = rect.origin.y
        move(to: CGPoint(x: l + rtl, y: t) )
        
        addLine(to: CGPoint(x: r - rtr, y: t))
        addArc(withCenter: CGPoint(x: r - rtr, y: t + rtr), radius: rtr, startAngle: (3 * CGFloat.pi)  / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        addLine(to: CGPoint(x: r , y: b - rbr))
        addArc(withCenter: CGPoint(x: r - rbr, y: b - rbr), radius: rbr, startAngle: 0 , endAngle: CGFloat.pi / 2, clockwise: true)
        
        addLine(to: CGPoint(x: l + rbl, y: b))
        addArc(withCenter: CGPoint(x: l + rbl, y: b - rbl), radius: rbl, startAngle: CGFloat.pi / 2 , endAngle: CGFloat.pi, clockwise: true)
        
        
        addLine(to: CGPoint(x: l, y: t + rtl))
        addArc(withCenter: CGPoint(x: l + rtl, y: t + rtl), radius: rtl, startAngle: CGFloat.pi , endAngle: (3 * CGFloat.pi ) / 2, clockwise: true)
        
        close()
    }
    
}


extension CGRect {
    
    var center : CGPoint {
         return .init(x: midX, y: midY)
    }
    
    var left : CGFloat {
        return self.origin.x
    }
    var top:CGFloat{
        return self.origin.y
    }
    var right : CGFloat {
        return self.origin.x + self.width
    }
    var bottom : CGFloat {
        return self.origin.y + self.height
    }

    mutating func setInset(dx: CGFloat,dy:CGFloat) {
        self.origin.x = self.origin.x + dx
        self.origin.y = self.origin.y + dy
        self.size.width = self.size.width - (dx*2)
        self.size.height = self.size.height - (dy*2)
    }
    
    
    mutating func set(rect: CGRect) {
        self.origin = rect.origin
        self.size = rect.size
    }
    mutating func set(left: CGFloat,top:CGFloat,right:CGFloat,bottom:CGFloat) {
        self.origin.x = left
        self.origin.y = top
        
        self.size.width = right - left
        self.size.height = bottom - top
    }
    
    mutating func setOffset(dx: CGFloat,dy:CGFloat) {
           self.origin.x = self.origin.x + dx
           self.origin.y = self.origin.y + dy
    }
    
    
    mutating func setScale(sx: CGFloat,sy:CGFloat) {
        if(sx < 0 && sy < 0 ){ return }
        let nw = self.width * sx
        let nh = self.height * sy
    
   
        let l = self.origin.x - (nw - self.width) / 2
        let t = self.origin.y - (nh - self.height) / 2

        self.origin.x = l
        self.origin.y = t
        self.size.width = nw
        self.size.height = nh
        
    }
    
    
    //MARK: Crop
   

   /**
     Returns true if the rectangle are inside or equal to this rectangle.
    **/
    mutating func contains(rect:CGRect)-> Bool{
        let rr = rect.origin.x + rect.width
        let rb = rect.origin.y + rect.height
        let r =  self.origin.x + self.width
        let b = self.origin.y + self.height
        return self.width > 0 && self.height > 0
            && self.origin.x <= rect.origin.x
            && self.origin.y <= rect.origin.y
            && r >= rr
            && b >= rb
    }
    
    
    func pointsToRotation(_ radian:CGFloat,cx:CGFloat,cy:CGFloat)-> [CGPoint]{
        let xAx = cos(radian)
        let xAy = sin(radian)
        let w = width
        let h = height
        var left = self.origin.x
        var top = self.origin.y
        left -= cx;
        top -= cy;

        let tl = CGPoint(x: left * xAx - top * xAy + cx , y: left * xAy + top * xAx + cy )
        let tr = CGPoint(x: (left + w) * xAx - top * xAy + cx , y: (left + w) * xAy + top * xAx + cy)
        let br = CGPoint(x: (left + w) * xAx - (top + h) * xAy + cx ,y:(left + w) * xAy + (top + h) * xAx + cy)
        let bl = CGPoint(x: left * xAx - (top + h) * xAy + cx, y:left * xAy + (top + h) * xAx + cy)

        return [tl,tr,bl,br]
          
    }
   
}


extension CGFloat {
    
    func toRadians()-> CGFloat{
        return (self * .pi) / 180
    }
    func toDegrees()-> CGFloat{
        return self * 180 / CGFloat.pi
    }
    
    func clamp(min:CGFloat = 0,max:CGFloat = 1) -> CGFloat{
        return self > max ? max : (self < min ? min : self)
    }
    func clampNotNegative()->CGFloat{
        return self < 0 ? 0 : self
    }
}
