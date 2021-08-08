//
//  ShapeDrawable.swift
//  ReactNativeClippath
//
//  Created by Juan J LF on 8/8/21.
//  Copyright © 2021 Facebook. All rights reserved.
//

import UIKit
public class ShapeDrawable: CAShapeLayer {
    
    
    public enum Shape {
        case circle,
             svgPath,
             radiusRelativeToWidth,
             radiusRelativeToHeight,
             none
    }
    
   
    
  
    //MARK: layer propertys
    private var mRotationX :CGFloat = 0
    private var mRotationY :CGFloat = 0
    private var mRotationZ :CGFloat = 0
    private var mRotationOrder :[DrawableAxis] = [.z,.x,.y]
    private var mTranslationX : CGFloat = 0
    private var mTranslationY : CGFloat = 0
 
    private var mTranslationPlusX : CGFloat = 0
    private var mTranslationPlusY : CGFloat = 0
    private var mIsTranslationPercent : Bool = false
    private var mScaleX  : CGFloat = 1
    private var mScaleY  : CGFloat = 1
    private var mInsetX  : CGFloat = 0
    private var mInsetY  : CGFloat = 0
    private var mBaseRect = CGRect()
    private var mRect = CGRect()
    private var mRadius :[CGFloat] = [0,0,0,0]
    private var mShape = Shape.none
    private var mSvgPath = ""
    private var mSvgAlign = "xMidYMid"
    private var mSvgAspect = ViewBox.AspectRatio.meet
    private var mVbRect = CGRect()
    
    
    //MARK: Path propertys
    private var mPath  = UIBezierPath()
    private var mPathScaleX:CGFloat = 1
    private var mPathScaleY:CGFloat = 1
    private var mPathTranslationX:CGFloat = 0
    private var mPathTranslationY:CGFloat = 0
    private var mPathRotation:CGFloat = 0
    private var mIsPathTranslationPercent = false
    private var mPathTranslationPlusX:CGFloat = 0
    private var mPathTranslationPlusY:CGFloat = 0
    
    public override init() {
        super.init()
        super.fillColor = UIColor.clear.cgColor
        super.shadowOffset = .init(width: 0, height: 0)
        super.lineWidth = 0
        super.strokeColor = UIColor.black.cgColor
        super.shadowOpacity = 0
        super.shadowRadius = 1
        super.shadowColor = UIColor.black.cgColor
    }
        

    
    //MARK: Path set and get
    @discardableResult
   public func setPathScale(sx:CGFloat,sy:CGFloat)-> ShapeDrawable{
       mPathScaleX = sx
       mPathScaleY = sy
       return self
   }
    @discardableResult
   public func setPathRotation(degrees: CGFloat) -> ShapeDrawable{
       mPathRotation = degrees
       return self
   }
    @discardableResult
   public func setPathTranslation(dx:CGFloat,dy:CGFloat)-> ShapeDrawable {
      mIsPathTranslationPercent = false
       mPathTranslationX = dx
       mPathTranslationY = dy
       return self
   }
   @discardableResult
   public func setPathTranslation(percentX:CGFloat,percentY:CGFloat, plusX:CGFloat = 0, plusY:CGFloat = 0)-> ShapeDrawable {
       mPathTranslationX = percentX
       mPathTranslationY = percentY
       mPathTranslationPlusX = plusX
       mPathTranslationPlusY = plusY
       mIsPathTranslationPercent = true
       return self
  }
    
    
    //MARK: set and get
    
    @discardableResult
   public func setShadowOffset(p:CGSize) -> ShapeDrawable{
    disableAnimation()
       super.shadowOffset = p
    commit()
       return self
   }
    @discardableResult
   public func setShadowRadius(r:CGFloat) -> ShapeDrawable{
    disableAnimation()
       super.shadowRadius = r
    commit()
       return self
   }
    @discardableResult
   public func setShadowOpacity(o:Float) -> ShapeDrawable{
    disableAnimation()
       super.shadowOpacity = o
    commit()
       return self
   }
    @discardableResult
   public func setShadowColor(c:CGColor) -> ShapeDrawable{
    disableAnimation()
       super.shadowColor = c
    commit()
       return self
   }
    
    //MARK: STROKE SET
    
    @discardableResult
   public func setStrokeWidth(w:CGFloat) -> ShapeDrawable{
        disableAnimation()
       super.lineWidth = w
        commit()
       return self
   }
    @discardableResult
   public func setStrokeColor(color:CGColor) -> ShapeDrawable{
        disableAnimation()
       super.strokeColor = color
        commit()
       return self
   }
    
    @discardableResult
   public func setStrokeStart(s:CGFloat) -> ShapeDrawable{
    disableAnimation()
    super.strokeStart = s
    commit()
       return self
   }
    @discardableResult
   public func setStrokeEnd(e:CGFloat) -> ShapeDrawable{
     disableAnimation()
    super.strokeEnd = e
    commit()
       return self
   }
    
    @discardableResult
   public func setStrokeCap(cap:CAShapeLayerLineCap) -> ShapeDrawable{
     disableAnimation()
    super.lineCap = cap
    commit()
       return self
   }
    
    @discardableResult
   public func setStrokeJoin(join:CAShapeLayerLineJoin) -> ShapeDrawable{
     disableAnimation()
    super.lineJoin = join
    commit()
       return self
   }
    @discardableResult
   public func setStrokeMiter(miter:CGFloat) -> ShapeDrawable{
     disableAnimation()
    super.miterLimit = miter
    commit()
       return self
   }
    //MARK: LAYER SET
    
    @discardableResult
    public func setSvgPath(d:String,viewBox:[CGFloat] = [0,0,0,0],align:String = "none",aspect:ViewBox.AspectRatio = .none) -> ShapeDrawable{
        mSvgPath = d
        mSvgAlign = align
        mSvgAspect = aspect
        
        mVbRect.origin.x = viewBox[0]
        mVbRect.origin.y = viewBox[1]
        mVbRect.size.width = viewBox[2]
        mVbRect.size.height = viewBox[3]
    
       
       return self
   }
    @discardableResult
   public func setShape(s:Shape) -> ShapeDrawable{
       mShape = s
       return self
   }
    @discardableResult
   public func setRadius(v:CGFloat) -> ShapeDrawable{
       mRadius = [v,v,v,v]
       return self
   }

    @discardableResult
    public func setRadius(topLeft:CGFloat,topRight:CGFloat,bottomLeft:CGFloat,bottomRight:CGFloat) -> ShapeDrawable{
       mRadius = [topLeft,topRight,bottomLeft,bottomRight]
       return self
   }
    @discardableResult
   public func setFillColor(c:CGColor) -> ShapeDrawable{
        disableAnimation()
       super.fillColor = c
    commit()
       return self
   }
   
    @discardableResult
    public func setInset(dx:CGFloat,dy:CGFloat) -> ShapeDrawable{
      mInsetX = dx
      mInsetY = dy
      return self
   }

    
    //MARK: layer set transform
     @discardableResult
    public func setScale(sx:CGFloat,sy:CGFloat)-> ShapeDrawable{
        mScaleX = sx
        mScaleY = sy
        return self
    }

     @discardableResult
    public func setRotationZ(degrees: CGFloat) -> ShapeDrawable{
        mRotationZ = degrees
        return self
    }
    @discardableResult
   public func setRotationX(degrees: CGFloat) -> ShapeDrawable{
       mRotationX = degrees
       return self
   }
    @discardableResult
   public func setRotationY(degrees: CGFloat) -> ShapeDrawable{
       mRotationY = degrees
 
       return self
   }
    @discardableResult
    public func setRotationOrder(f: DrawableAxis,s:DrawableAxis,t:DrawableAxis) -> ShapeDrawable{
        if (f == s || f == t) || ( s == t ) { return self}
       mRotationOrder = [f,s,t]
       return self
   }
     @discardableResult
    public func setTranslation(dx:CGFloat,dy:CGFloat)-> ShapeDrawable {
        mIsTranslationPercent = false
        mTranslationX = dx
        mTranslationY = dy
        return self
    }
    @discardableResult
    public func setTranslation(percentX:CGFloat,percentY:CGFloat, plusX:CGFloat = 0,plusY:CGFloat = 0)-> ShapeDrawable {
        mTranslationX = percentX
        mTranslationY = percentY
        mTranslationPlusX = plusX
        mTranslationPlusY = plusY
        mIsTranslationPercent = true
        return self
   }
 
    
    private var mFirstBounds = CGRect()
    private var mBoundsX:CGFloat = 0
    private var mBoundsY:CGFloat = 0
    private var mBoundsWidth:CGFloat = 0
    private var mBoundsHeight:CGFloat = 0
    private var mIsBoundsDynamically = false
    private var mIsBoundsPercentPos = false
    private var mIsBoundsPercentSize = false
    /**
     
      Put the position and size of the layer where it will draw  relative in percentage-absolute to the bounds it received, naturally it always receives the bounds of the parent.
      
      Percentage values  0 = 0% - 1 = 100%
      
      - Parameters:
          - x :  x origin
          - y :  y origin
          - width : a width value
          - height : a height value
          - percentPos : if origin is a percentage value, default false
          - percentSize: if size is a percentage value, default false
      
      */
    @discardableResult
    public func setBoundsDynamically(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat,percentPos:Bool = false,percentSize:Bool = false)-> ShapeDrawable{
        mIsBoundsDynamically = true
        mIsBoundsPercentPos = percentPos
        mIsBoundsPercentSize = percentSize
        mBoundsX = x
        mBoundsY = y
        mBoundsWidth = width.clampNotNegative()
        mBoundsHeight = height.clampNotNegative()
        return self
    }
    
    
    //MARK: layer methods
    
    public func onBoundsChange(_ frame: CGRect,invalidate:Bool = true){
        mFirstBounds.set(rect: frame)
        var left = mBoundsX
        var top = mBoundsY
        var width = mBoundsWidth
        var height = mBoundsHeight
        if(mIsBoundsPercentPos){
            left = mBoundsX * frame.width
            top = mBoundsY * frame.height
            
        }
        if(mIsBoundsPercentSize){
            width = mBoundsWidth * frame.width
            height = mBoundsHeight * frame.height
        }
        if(mIsBoundsDynamically){
            
            mBaseRect.origin.x = left
            mBaseRect.origin.y = top
            mBaseRect.size.width = width
            mBaseRect.size.height = height
         
        }else{
            mBaseRect.set(rect: frame)
        }
        
        super.frame = mBaseRect
        if invalidate { invalidateSelf() }
    }
    
    private func draw(){
        if(frame.width > 0 && frame.height > 0){
            setupRect()
            setupPath()
            makeTransform()
        }
    }
    
 
    
    private func setupRect(){
        mRect.origin.x = 0
        mRect.origin.y = 0
        mRect.size.width = mBaseRect.width
        mRect.size.height = mBaseRect.height
        mRect.setInset(dx: mInsetX, dy: mInsetY)
        
    }
    
    private func setupPath(){
        mPath.removeAllPoints()
        switch mShape {
        case .circle:
            let r = min(mRect.width, mRect.height) / 2
            mRadius = [r,r,r,r]
            //cw
            mPath.addRoundRect(mRect, radius: mRadius)
            break
        case .radiusRelativeToHeight,.radiusRelativeToWidth :
            let tl = mRadius[0].clamp()
            let tr = mRadius[1].clamp()
            let bl = mRadius[2].clamp()
            let br = mRadius[3].clamp()
            var size = mShape == .radiusRelativeToWidth ? mRect.width : 0
            size = mShape == .radiusRelativeToHeight ? mRect.height : size
            mRadius[0] = tl * size
            mRadius[1] = tr * size
            mRadius[2] = bl * size
            mRadius[3] = br * size
            //cw
            mPath.addRoundRect(mRect, radius: mRadius)
            break
   
        case .svgPath:
            
            do{
                mPath = try SVGPathParser.parse(d: mSvgPath)
                if mVbRect.width > 0 && mVbRect.height > 0 {
                    let trans = ViewBox.transform(vbRect: mVbRect, eRect: mRect, align: mSvgAlign, meetOrSlice: mSvgAspect)
                  
                    mPath.apply(trans)
                }
            }catch{
                print("Exception: ",error)
            }
           
        default:
            mPath.addRoundRect(mRect, radius: mRadius)
        }
        
        var transX : CGFloat = mPathTranslationX
        var transY : CGFloat = mPathTranslationY
        //path transform
        if(mIsPathTranslationPercent){
            transX = (mPathTranslationX * mBaseRect.width) + mPathTranslationPlusX
            transY = (mPathTranslationY * mBaseRect.height) + mPathTranslationPlusY
        }
   
        //first translate for rotate and scale from center
        let t = CGAffineTransform.identity
            .translatedBy(x: transX, y: transY)
            
            .translatedBy(x: mPath.bounds.center.x, y: mPath.bounds.center.y)
            .rotated(by: mPathRotation.toRadians())
            .scaledBy(x: mPathScaleX, y: mPathScaleY)
            .translatedBy(x: -mPath.bounds.center.x , y: -mPath.bounds.center.y)
          
         
            
        mPath.apply(t)
        
        path = mPath.cgPath
        shadowPath = mPath.cgPath
    }
    
  

   
    
  
    
    public func invalidateSelf(){
        draw()
    }
    
    
 
    private func makeTransform(_ animated:Bool = false){
      
        if(animated && duration > 0){
            applyTransform()
        }else {
            disableAnimation()
            applyTransform()
            commit()
        }
    }
    private func applyTransform(){
        var transX : CGFloat = mTranslationX
        var transY : CGFloat = mTranslationY
        if(mIsTranslationPercent){
            transX = (mTranslationX * mFirstBounds.width) + mTranslationPlusX
            transY = (mTranslationY * mFirstBounds.height) + mTranslationPlusY
        }

        var result  = CATransform3DTranslate(CATransform3DIdentity, transX, transY, 0)
        
        var per = CATransform3DIdentity
        per.m34 = 1 / -400;
        for e in mRotationOrder {
            if e == .z{
                per =  CATransform3DRotate(per, mRotationZ.toRadians(), 0, 0, 1)
            }
            if e == .y{
                per = CATransform3DRotate(per, -mRotationY.toRadians(), 0, 1, 0)
            }
            if e == .x{
                per = CATransform3DRotate(per, -mRotationX.toRadians(), 1, 0, 0)
            }
        }

        result = CATransform3DConcat(per, result)
        result = CATransform3DScale(result, mScaleX, mScaleX, 1)
        
        self.transform = result
    }
    private func disableAnimation(){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
    }
    
    private func commit(){
        CATransaction.commit()
    }
    
    
    
   
    public override init(layer: Any) {
        super.init(layer: layer)

    }
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    //MARK : public override
    
//       public override var backgroundColor :CGColor? {
//           set { print("Drawable - Background is not supported") }
//           get { return super.backgroundColor }
//       }
      
}
