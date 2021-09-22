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
        return "ClipPathNone";
    }
    
    @Override
    protected ClipPathViewNone createViewInstance(@NonNull ThemedReactContext reactContext) {
        return new ClipPathViewNone(reactContext);
    }

    @Override
    public void setBackgroundColor(@NonNull ClipPathViewNone view, int backgroundColor) {
        view.setBgColor(backgroundColor);
    }

    @ReactProp(name = "path")
    public void setPath(ClipPathViewNone view, ReadableMap p){
        String d = ModUtil.getString(p,"d","");
        ReadableArray viewBox = ModUtil.getArray(p,"viewBox",null);

        float [] v = {0f,0f,0f,0f};
        if(viewBox != null) {
            v[0] = (float) viewBox.getDouble(0);
            v[1] = (float) viewBox.getDouble(1);
            v[2] = (float) viewBox.getDouble(2);
            v[3] = (float)viewBox.getDouble(3);
        }
        view.setD(d,v);
    }
    @ReactProp(name = "pathRotation",defaultFloat = 0f)
    public void setPathRotation(ClipPathViewNone view , float r){
       view.setRotation(r);
    }
    @ReactProp(name = "pathScale",defaultFloat = 1f)
    public void setPathScale(ClipPathViewNone view,float v){
       view.setScale(v,v);
    }

    @ReactProp(name = "pathTranslation")
    public void setPathTranslation(ClipPathViewNone view,ReadableMap v){
        float dx = (float)ModUtil.getDouble(v,"dx",0.0);
        float dy = (float)ModUtil.getDouble(v,"dy",0.0);
        boolean per = ModUtil.getBoolean(v,"percentageValue",false);

        view.setTranslation(dx,dy,per);
    }


    private float toDip(float num, ClipPathViewNone view){
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP,num,view.getResources().getDisplayMetrics());
    }
}