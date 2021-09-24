package com.jjlf.rnclippath;


import android.graphics.Color;
import android.util.TypedValue;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.bridge.Dynamic;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewGroupManager;
import com.facebook.react.uimanager.annotations.ReactProp;

class ClipPathViewManager extends ViewGroupManager<ClipPathView> {

 
    @Override
    public String getName() {
        return "JJSClipPath";
    }
    
    @Override
    protected ClipPathView createViewInstance(@NonNull ThemedReactContext reactContext) {
        return new ClipPathView(reactContext);
    }

    @Override
    public void setTransform(@NonNull  ClipPathView view, @Nullable ReadableArray matrix) {
        super.setTransform(view, matrix);
    }

    @ReactProp(name = "d")
    public void setD(ClipPathView view, String v){
        String p = v == null ? "" :  v;
        view.setD(p);
    }
    @ReactProp(name = "viewBox")
    public void setViewBox(ClipPathView view, ReadableArray viewBox){
        float [] v = {0f,0f,-1f,-1f};
        if(viewBox != null) {
            v[0] = (float) viewBox.getDouble(0);
            v[1] = (float) viewBox.getDouble(1);
            v[2] = (float) viewBox.getDouble(2);
            v[3] = (float) viewBox.getDouble(3);
        }
        view.setViewBox(v);
    }
    @ReactProp(name = "align")
    public void setAlign(ClipPathView view, String v){
        String p = v == null ? "xMidYMid" :  v;
        view.setAlign(p);
    }
    @ReactProp(name = "aspect")
    public void setAspect(ClipPathView view, String v){
        int p = v == null ? SVGViewBox.MOS_MEET :  (v.equals("slice") ? SVGViewBox.MOS_SLICE :  (v.equals("none") ? SVGViewBox.MOS_NONE : SVGViewBox.MOS_MEET ) );
        view.setAspect(p);
    }

  @ReactProp(name = "translateZ",defaultFloat = 0f)
    public void setTranslateZ(ClipPathView view ,float v) {
        view.setTranslateZ(v);
    }

    @ReactProp(name = "fillRule")
    public void setFillRule(ClipPathView view ,String v) {
        view.setFillRule(v == null ? "none" : v);

    }

    @ReactProp(name = "strokeWidth",defaultFloat = 1f)
    public void setStrokeWith(ClipPathView view ,float v) {
        view.setStrokeWith(v);

    }
    @ReactProp(name = "strokeCap")
    public void setStrokeCap(ClipPathView view ,String v) {
        view.setStrokeCap(v == null ? "none" : v);

    }

    @ReactProp(name = "strokeJoin")
    public void setStrokeJoin(ClipPathView view ,String v) {
        view.setStrokeJoin(v == null ? "none" : v);

    }
    @ReactProp(name = "strokeMiter",defaultFloat = 4f)
    public void setStrokeMiter(ClipPathView view ,float v) {
        view.setStrokeMiter(v);

    }

    @ReactProp(name = "strokeStart",defaultFloat = 0f)
    public void setStrokeStart(ClipPathView view ,float v) {
        view.setStrokeStart(v);

    }
    @ReactProp(name = "strokeEnd",defaultFloat = 1f)
    public void setStrokeEnd(ClipPathView view ,float v) {
        view.setStrokeEnd(v);

    }


    //MARK: Transform

    @ReactProp(name = "transX",defaultFloat = 0f)
    public void setTransX(ClipPathView view, float v) {
        view.setTransX(v);
    }
    @ReactProp(name = "transY",defaultFloat = 0f)
    public void setTransY(ClipPathView view, float v) {
        view.setTransY(v);
    }
    @ReactProp(name = "transPercentageValue",defaultBoolean = false)
    public void setTransPercentageValue(ClipPathView view, boolean v) {
        view.setTransPercentageValue(v);
    }

    @ReactProp(name = "rot",defaultFloat = 0f)
    public void setRot(ClipPathView view , float v) {
        view.setRot(v);
    }
    @ReactProp(name = "rotO",defaultFloat = 0f)
    public void setRotO(ClipPathView view , float v) {
        view.setRotO(v);
    }
    @ReactProp(name = "rotOx",defaultFloat = 0f)
    public void setRotOx(ClipPathView view , float v) {
        view.setRotOx(v);
    }
    @ReactProp(name = "rotOy",defaultFloat = 0f)
    public void setRotOy(ClipPathView view , float v) {
        view.setRotOy(v);
    }
    @ReactProp(name = "rotPercentageValue",defaultBoolean  = false)
    public void setRotPercentageValue(ClipPathView view , boolean v) {
        view.setRotPercentageValue(v);
    }

    @ReactProp(name = "sc",defaultFloat = 1f)
    public void setSc(ClipPathView view, float v) {
        view.setSc(v);
    }
    @ReactProp(name = "scX",defaultFloat = 1f)
    public void setScX(ClipPathView view, float v) {
        view.setScX(v);
    }
    @ReactProp(name = "scY",defaultFloat = 1f)
    public void setScY(ClipPathView view, float v) {
        view.setScY(v);
    }
    @ReactProp(name = "scO",defaultFloat = 0f)
    public void setScO(ClipPathView view, float v) {
        view.setScO(v);
    }
    @ReactProp(name = "scOx",defaultFloat = 0f)
    public void setScOx(ClipPathView view, float v) {
        view.setScOx(v);
    }
    @ReactProp(name = "scOy",defaultFloat = 0f)
    public void setScOy(ClipPathView view, float v) {
        view.setScOy(v);
    }
    @ReactProp(name = "scPercentageValue",defaultBoolean = false)
    public void setScPercentageValue(ClipPathView view, boolean v) {
        view.setScPercentageValue(v);
    }
}