package com.jjlf.rnclippath;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.os.Build;
import android.view.ViewGroup;


public class ClipPathView extends ViewGroup {

    private final Paint mPaintMask = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint mPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    public static final PorterDuffXfermode dstIn = new PorterDuffXfermode(PorterDuff.Mode.DST_IN);
    public static final PorterDuffXfermode dstOut = new PorterDuffXfermode(PorterDuff.Mode.DST_OUT);
    ClipPathView(Context context){
        super(context);
        setClipChildren(false);
        mPaint.setStyle(Paint.Style.FILL);
        mPaint.setColor(Color.WHITE);
        setLayerType(LAYER_TYPE_HARDWARE,null);
    }


    @Override
    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        mPaintMask.setXfermode(dstIn);
        canvas.saveLayer(0f,0f,getWidth(),getHeight(),mPaintMask);
        drawPath(canvas);
        canvas.restore();
        if(Build.VERSION.SDK_INT <= Build.VERSION_CODES.M && canvas.isHardwareAccelerated()){
            mPaintMask.setXfermode(dstOut);
            int main = canvas.saveLayer(0f,0f,getWidth(),getHeight(),mPaintMask);
            canvas.drawColor(Color.BLACK);
            mPaintMask.setXfermode(dstOut);
            int clip = canvas.saveLayer(0f,0f,getWidth(),getHeight(),mPaintMask);
            drawPath(canvas);
            canvas.restoreToCount(clip);
            canvas.restoreToCount(main);
        }
    }


    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        mBounds.set(0f,0f,w,h);
        super.onSizeChanged(w, h, oldw, oldh);
    }

    private final RectF mPathBounds = new RectF();
    private final RectF mBounds = new RectF();
    private final Matrix mMatrix = new Matrix();
    private String mD = "";
    private final RectF mVbRect = new RectF();
    public void setD(String d, float[] viewBox){
        mD = d;
        float density = getResources().getDisplayMetrics().density;
        mVbRect.set(viewBox[0] * density ,viewBox[1] * density,(viewBox[0] + viewBox[2]) * density ,(viewBox[1] + viewBox[3]) * density);
        invalidate();
    }
    private float mRotation = 0f;
    public void setRotation(float v){
        if(mRotation != v){
            mRotation = v;
            invalidate();
        }
    }

    private float mScaleX = 1f;
    private float mScaleY = 1f;
    public void setScale(float x,float y){
        if(mScaleX != x || mScaleY != y){
            mScaleX = x;
            mScaleY = y;
            invalidate();
        }
    }

    private float mTransX = 0f;
    private float mTransY = 0f;
    private boolean mTransPer = false;
    public void setTranslation(float x,float y,boolean per){
        if(mTransX != x || mTransY != y || mTransPer != per){
            mTransX = x;
            mTransY = y;
            mTransPer = per;
            invalidate();
        }
    }

    private final Path mPath = new Path();
    private void drawPath(Canvas canvas){

        mPath.reset();
        try{
            SVGPathParser.mScale = getResources().getDisplayMetrics().density;
            final Path p = SVGPathParser.parse(mD);
            mPath.set(p);
            if (mVbRect.width() > 0f && mVbRect.height() > 0f){
                SVGViewBox.transform(mVbRect,mBounds,"xMidYMid",0,mMatrix);
                mPath.transform(mMatrix);
            }
        }catch(Error ignored) {

        }
        //path transform
        float  transX = mTransX;
        float transY = mTransY;
        if(mTransPer){
            transX = mTransX * getWidth() ;
            transY = mTransY * getHeight() ;
        }
        mPathBounds.set(0f,0f,0f,0f);
        mPath.computeBounds(mPathBounds,true);
        mMatrix.reset();
        mMatrix.postRotate(mRotation,mPathBounds.centerX(),mPathBounds.centerY());
        mMatrix.postScale(mScaleX,mScaleY,mPathBounds.centerX(),mPathBounds.centerY());
        mMatrix.postTranslate(transX,transY);
        mPath.transform(mMatrix);

        canvas.drawPath(mPath,mPaint);

    }


    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {

    }


}
