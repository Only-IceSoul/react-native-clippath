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
    

    private let mDrawable = ClipDrawable()
    
    
    init() {
        super.init(frame: .zero)
        mDrawable.setFill(0xFFFFFFFF)
        mDrawable.setStroke(0xFFFFFFFF)
        layer.mask = mDrawable
       
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        mDrawable.setFill(0xFFFFFFFF)
        mDrawable.setStroke(0xFFFFFFFF)
        layer.mask = mDrawable
      
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override var bounds: CGRect{
        didSet{
            mDrawable.onBoundsChange(self.bounds)
          
        }
    }
    
    @objc func setD(_ v:String?){
        let ev = v == nil ? "" : v!
        mDrawable.setD(ev)
    }
    
    @objc func setViewBox(_ v:NSArray?){
        let arr = v as? [CGFloat] ?? [0 , 0 ,-1 ,-1]
        mDrawable.setViewBox(arr)
    }
   
    @objc func setAlign(_ v:NSString?){
        let align = v as String? ?? "xMidYMid"
        mDrawable.setAlign(align)
    }
    @objc func setAspect(_ v:NSString?){
        let aspect = v as String? ?? "meet"
        let a : SVGViewBox.AspectRatio = aspect == "slice" ? .slice : ( aspect == "none" ? .none : .meet)
        mDrawable.setAspect(a)
    }
    
    
    @objc func setTranslateZ(_ v:NSNumber?){
        let ev = CGFloat(truncating: v ?? 0)
        layer.zPosition = ev

    }

   


    @objc func setFillRule(_ v:NSString?) {
        let rule = v as String? ?? "none"
        mDrawable.setFillRule(rule)
    }



    @objc func setStrokeWidth(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 1)
        mDrawable.setStrokeWidth(ev)
    }


    @objc func setStrokeCap(_ v:NSString?) {
        let ev = v as String? ?? "none"
        mDrawable.setStrokeCap(ev)
    }


    @objc func setStrokeJoin(_ v:NSString?) {
        let ev = v as String? ?? "none"
        mDrawable.setStrokeJoin(ev)
    }

    @objc func setStrokeMiter(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 4)
        mDrawable.setStrokeMiter(ev)
       
    }


    @objc func setStrokeStart(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setStrokeStart(ev)
       
    }


    @objc func setStrokeEnd(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 1)
        mDrawable.setStrokeEnd(ev)
    }


    
    //MARK: Transform props
    @objc func setTransX(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setTransX(v: ev)
       }
    @objc func setTransY(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setTransY(v: ev)
       }
    @objc func setTransPercentageValue(_ v:NSNumber?) {
        let n = v == nil ? 0 : Int(truncating: v!)
        let b = n >= 1 ? true : false
        mDrawable.setTransPercentageValue(v: b)
       }

    @objc func setRot(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setRot(v: ev)
       }
    @objc func setRotO(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setRotO(v: ev)
       }
    @objc func setRotOx(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setRotOx(v: ev)
       }
    @objc func setRotOy(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setRotOy(v: ev)
       }
    @objc func setRotPercentageValue(_ v:NSNumber?) {
        let n = v == nil ? 0 : Int(truncating: v!)
        let b = n >= 1 ? true : false
        mDrawable.setRotPercentageValue(v: b)
       }

    @objc func setSc(_ v:NSNumber?){
        let ev = CGFloat(truncating: v ?? 1)
        mDrawable.setSc(v: ev)
       }
    @objc func setScX(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 1)
        mDrawable.setScX(v: ev)
       }

    @objc func setScY(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 1)
        mDrawable.setScY(v: ev)
       }
    @objc func setScO(_ v:NSNumber?){
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setScO(v: ev)
       }
    @objc func setScOx(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setScOx(v: ev)
       }
    @objc func setScOy(_ v:NSNumber?) {
        let ev = CGFloat(truncating: v ?? 0)
        mDrawable.setScOy(v: ev)
       }
    @objc func setScPercentageValue(_ v:NSNumber?) {
        let n = v == nil ? 0 : Int(truncating: v!)
        let b = n >= 1 ? true : false
        mDrawable.setScPercentageValue(v: b)
       }

          
  
  
    
  
    
 

}
