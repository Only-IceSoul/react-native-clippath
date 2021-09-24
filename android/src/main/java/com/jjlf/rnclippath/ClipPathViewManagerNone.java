package com.jjlf.rnclippath;


import android.util.TypedValue;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewGroupManager;
import com.facebook.react.uimanager.annotations.ReactProp;

class ClipPathViewManagerNone extends ViewGroupManager<ClipPathViewNone> {

 
    @Override
    public String getName() {
        return "JJSClipPathNone";
    }
    
    @Override
    protected ClipPathViewNone createViewInstance(@NonNull ThemedReactContext reactContext) {
        return new ClipPathViewNone(reactContext);
    }

    @Override
    public void setBackgroundColor(@NonNull ClipPathViewNone view, int backgroundColor) {
        view.setBgColor(backgroundColor);
    }
    @ReactProp(name = "d")
    public void setD(ClipPathViewNone view, String d){
        String p = d == null ? "" :  d;
        view.setD(p);
    }
    @ReactProp(name = "viewBox")
    public void setViewBox(ClipPathViewNone view, ReadableArray viewBox){
        float [] v = {0f,0f,0f,0f};
        if(viewBox != null) {
            v[0] = (float) viewBox.getDouble(0);
            v[1] = (float) viewBox.getDouble(1);
            v[2] = (float) viewBox.getDouble(2);
            v[3] = (float) viewBox.getDouble(3);
        }
        view.setViewBox(v);
    }

    @ReactProp(name = "align")
    public void setAlign(ClipPathViewNone view, String v){
        String p = v == null ? "xMidYMid" :  v;
        view.setAlign(p);
    }
    @ReactProp(name = "aspect")
    public void setAspect(ClipPathViewNone view, String v){
        int p = v == null ? SVGViewBox.MOS_MEET :  (v.equals("slice") ? SVGViewBox.MOS_SLICE :  (v.equals("none") ? SVGViewBox.MOS_NONE : SVGViewBox.MOS_MEET ) );
        view.setAspect(p);
    }

    @ReactProp(name = "fillRule")
    public void setFillRule(ClipPathViewNone view ,String v) {
        view.setFillRule(v == null ? "none" : v);
    }
    @ReactProp(name = "strokeWidth",defaultFloat = 1f)
    public void setStrokeWith(ClipPathViewNone view ,float v) {
        view.setStrokeWith(v);
    }
    @ReactProp(name = "strokeCap")
    public void setStrokeCap(ClipPathViewNone view ,String v) {
        view.setStrokeCap(v == null ? "none" : v);
    }
    @ReactProp(name = "strokeJoin")
    public void setStrokeJoin(ClipPathViewNone view ,String v) {
        view.setStrokeJoin(v == null ? "none" : v);
    }
    @ReactProp(name = "strokeMiter",defaultFloat = 4f)
    public void setStrokeMiter(ClipPathViewNone view ,float v) {
        view.setStrokeMiter(v);
    }
    @ReactProp(name = "strokeStart",defaultFloat = 0f)
    public void setStrokeStart(ClipPathViewNone view ,float v) {
        view.setStrokeStart(v);
    }
    @ReactProp(name = "strokeEnd",defaultFloat = 1f)
    public void setStrokeEnd(ClipPathViewNone view ,float v) {
        view.setStrokeEnd(v);
    }


    //MARK: Transform

    @ReactProp(name = "transX",defaultFloat = 0f)
    public void setTransX(ClipPathViewNone view, float v) {
        view.setTransX(v);
    }
    @ReactProp(name = "transY",defaultFloat = 0f)
    public void setTransY(ClipPathViewNone view, float v) {
        view.setTransY(v);
    }
    @ReactProp(name = "transPercentageValue",defaultBoolean = false)
    public void setTransPercentageValue(ClipPathViewNone view, boolean v) {
        view.setTransPercentageValue(v);
    }

    @ReactProp(name = "rot",defaultFloat = 0f)
    public void setRot(ClipPathViewNone view , float v) {
        view.setRot(v);
    }
    @ReactProp(name = "rotO",defaultFloat = 0f)
    public void setRotO(ClipPathViewNone view , float v) {
        view.setRotO(v);
    }
    @ReactProp(name = "rotOx",defaultFloat = 0f)
    public void setRotOx(ClipPathViewNone view , float v) {
        view.setRotOx(v);
    }
    @ReactProp(name = "rotOy",defaultFloat = 0f)
    public void setRotOy(ClipPathViewNone view , float v) {
        view.setRotOy(v);
    }
    @ReactProp(name = "rotPercentageValue",defaultBoolean  = false)
    public void setRotPercentageValue(ClipPathViewNone view , boolean v) {
        view.setRotPercentageValue(v);
    }

    @ReactProp(name = "sc",defaultFloat = 1f)
    public void setSc(ClipPathViewNone view, float v) {
        view.setSc(v);
    }
    @ReactProp(name = "scX",defaultFloat = 1f)
    public void setScX(ClipPathViewNone view, float v) {
        view.setScX(v);
    }
    @ReactProp(name = "scY",defaultFloat = 1f)
    public void setScY(ClipPathViewNone view, float v) {
        view.setScY(v);
    }
    @ReactProp(name = "scO",defaultFloat = 0f)
    public void setScO(ClipPathViewNone view, float v) {
        view.setScO(v);
    }
    @ReactProp(name = "scOx",defaultFloat = 0f)
    public void setScOx(ClipPathViewNone view, float v) {
        view.setScOx(v);
    }
    @ReactProp(name = "scOy",defaultFloat = 0f)
    public void setScOy(ClipPathViewNone view, float v) {
        view.setScOy(v);
    }
    @ReactProp(name = "scPercentageValue",defaultBoolean = false)
    public void setScPercentageValue(ClipPathViewNone view, boolean v) {
        view.setScPercentageValue(v);
    }
    

}