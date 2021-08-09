package com.jjlf.rnclippath;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.os.SystemClock;
import android.util.Log;
import android.view.ViewGroup;

public class ClipPathView extends ViewGroup {

    private final ShapeDrawable mDrawable = new ShapeDrawable();
    ClipPathView(Context context){
        super(context);
        setClipChildren(false);
        mDrawable.setShape(ShapeDrawable.SVG_PATH);
        mDrawable.setFillColor(Color.WHITE);

    }

    ShapeDrawable getDrawable(){
    return mDrawable;
    }

    private Bitmap mBitmap;
    private final Canvas mCanvas = new Canvas();
    private final Paint mPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final PorterDuffXfermode mPorterDuffXferMode = new PorterDuffXfermode(PorterDuff.Mode.DST_IN);
    @Override
    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);

        if(mBitmap != null){
//            mCanvas.drawColor(Color.TRANSPARENT, PorterDuff.Mode.CLEAR);
            mBitmap.eraseColor(Color.TRANSPARENT);
            mDrawable.draw(mCanvas);
            setLayerType(LAYER_TYPE_HARDWARE,mPaint);
            mPaint.setXfermode(mPorterDuffXferMode);
            canvas.drawBitmap(mBitmap,0f,0f,mPaint);
            mPaint.setXfermode(null);

        }
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);

        if(mBitmap == null){
            mBitmap = Bitmap.createBitmap(w,h,Bitmap.Config.ARGB_8888);
            mCanvas.setBitmap(mBitmap);
            mDrawable.setBounds(0,0,w,h);
        }else{
            if(mBitmap.getWidth() != w || mBitmap.getHeight() != h){
                mBitmap = Bitmap.createBitmap(w,h,Bitmap.Config.ARGB_8888);
                mCanvas.setBitmap(mBitmap);
                mDrawable.setBounds(0,0,w,h);
            }
        }
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {

    }
}
