package com.jjlf.rnclippath;


import android.util.TypedValue;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewGroupManager;
import com.facebook.react.uimanager.annotations.ReactProp;

class ClipPathViewManager extends ViewGroupManager<ClipPathView> {

 
    @Override
    public String getName() {
        return "ClipPath";
    }
    
    @Override
    protected ClipPathView createViewInstance(@NonNull ThemedReactContext reactContext) {
        return new ClipPathView(reactContext);
    }

    @ReactProp(name = "path")
    public void setPath(ClipPathView view, ReadableMap p){
        String d = ModUtil.getString(p,"d","");
        ReadableArray viewBox = ModUtil.getArray(p,"viewBox",null);

        float [] v = {0f,0f,0f,0f};
        if(viewBox != null) {
            v[0] = (float) viewBox.getDouble(0);
            v[1] = (float) viewBox.getDouble(1);
            v[2] = (float) viewBox.getDouble(2);
            v[3] = (float)viewBox.getDouble(3);
        }
        view.getDrawable().setSvgPath(d,view.getResources().getDisplayMetrics().density, v,"xMidYMid",ShapeDrawable.VIEW_BOX_MEET);
        invalidate();
    }
    @ReactProp(name = "pathRotation",defaultFloat = 0f)
    public void setPathRotation(ClipPathView view , float r){
        view.getDrawable().setPathRotation(r);
        view.invalidate();
    }
    @ReactProp(name = "pathScale")
    public void setPathScale(ClipPathView view,ReadableMap v){
        float  x = (float)ModUtil.getDouble(v,"x",1.0);
        float y = (float)ModUtil.getDouble(v,"y",1.0);
        view.getDrawable().setPathScale(x,y);
        view.invalidate();
    }

    @ReactProp(name = "pathTranslation")
    public void setPathTranslation(ClipPathView view,ReadableMap v){
        float dx = (float)ModUtil.getDouble(v,"dx",0.0);
        float dy = (float)ModUtil.getDouble(v,"dy",0.0);
        boolean per = ModUtil.getBoolean(v,"percentageValue",false);

        if(per){
          view.getDrawable().setPathTranslation(dx,dy,0f,0f);
        }else{
          view.getDrawable().setPathTranslation(toDip(dx,view),toDip(dy,view));
        }
        view.invalidate();
    }


    private float toDip(float num, ClipPathView view){
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP,num,view.getResources().getDisplayMetrics());
    }
}