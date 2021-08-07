import React from "react";
import { Constructor, NativeMethods, ViewProps } from "react-native";


interface ClipPathViewProps extends ViewProps {
  
    path?:{
        d:string
        viewBox:number[] 
    }
    pathScale?:{ x:number,y:number }
    pathRotation?: number
    pathTranslation?:{
        dx:number,
        dy:number,
        percentageValue:boolean
    }
  
}

declare class ClipPathComponent extends React.Component<ClipPathViewProps> {}
declare const ClipPathViewBase: Constructor<NativeMethods> & typeof ClipPathComponent;

export default class ClipPathView extends ClipPathViewBase {}
