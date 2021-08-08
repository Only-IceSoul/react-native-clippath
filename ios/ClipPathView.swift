//
//  ClipPathView.swift
//  ReactNativeClippath
//
//  Created by Juan J LF on 8/8/21.
//  Copyright © 2021 Facebook. All rights reserved.
//

import Foundation
import UIKit

@objc(ClipPathView)
class ClipPathView: UIView {
    

    private let mDrawable = ShapeDrawable()
    
    
    init() {
        super.init(frame: .zero)
        layer.mask = mDrawable
        mDrawable.setShape(s: .svgPath)
        mDrawable.setStrokeMiter(miter: 4)
        mDrawable.setFillColor(c: UIColor.white.cgColor)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.mask = mDrawable
        mDrawable.setShape(s: .svgPath)
        mDrawable.setStrokeMiter(miter: 4)
        mDrawable.setFillColor(c: UIColor.white.cgColor)
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override var bounds: CGRect{
        didSet{
            mDrawable.onBoundsChange(self.bounds)
          
        }
    }
    
    @objc func setPath(_ p:[String:Any]?){

        let d = p?["d"] as? String ?? ""
        let viewBox = p?["viewBox"] as? [CGFloat] ?? [0,0,0,0]
        mDrawable.setSvgPath(d: d,viewBox: viewBox,align: "xMidYMid",aspect: .meet)
        mDrawable.invalidateSelf()

        
    }
    @objc func setPathRotation(_ r:NSNumber?){
        let rotation = CGFloat(truncating: r ?? 0)
        mDrawable.setPathRotation(degrees: rotation)
        mDrawable.invalidateSelf()
      
    }
    @objc func setPathScale(_ v:NSNumber?){
        let s = CGFloat(truncating: v ?? 1)
        mDrawable.setPathScale(sx: s, sy:s)
        mDrawable.invalidateSelf()

    }
    @objc func setPathTranslation(_ v:[String:Any]?){

        let x = v?["dx"] as? CGFloat ?? 0
        let y = v?["dy"] as? CGFloat ?? 0
        let per = v?["percentageValue"] as? Bool ?? false
      
        if(per){
            mDrawable.setPathTranslation(percentX: x, percentY: y, plusX: 0, plusY: 0)
        }else{
            mDrawable.setPathTranslation(dx: x, dy: y)
        }
        mDrawable.invalidateSelf()

     
    }
    
 
          
  
  
    
  
    
 

}
