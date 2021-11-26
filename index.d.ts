import React from "react";
import { Constructor, NativeMethods, ViewProps } from "react-native";


interface ClipPathViewProps extends ViewProps {
    svgKey?:string // web
    d?:string
    viewBox?:number[] 
    aspect?: 'meet' | 'slice' | 'none'
    align?:'xMinYMin'|
    'xMidYMin' |
    'xMaxYMin' |
    'xMinYMid' |
    'xMidYMid' |
    'xMaxYMid' |
    'xMinYMax' |
    'xMidYMax' |
    'xMaxYMax' |
    'none'

    translateZ?:number

    fillRule?: 'evenodd' | 'nonzero'
    strokeWidth?:number
    strokeStart?:number
    strokeEnd?:number
    strokeCap?:'butt' | 'round' | 'square'
    strokeJoin?: 'bevel' | 'miter' | 'round'
    strokeMiter?:number

    // transformOrder?: "r-s-t" | "r-t-s" | "s-r-t" | "s-t-r" | "t-r-s" | "t-s-r" 

    transX?:number
    transY?:number
    transPercentageValue?:boolean
    
    rot?:number
    rotO?:number
    rotOx?:number
    rotOy?:number
    rotPercentageValue?:boolean

    sc?:number
    scX?:number
    scY?:number
    scO?:number
    scOx?:number
    scOy?:number
    scPercentageValue?:boolean
  
}

declare class ClipPathComponent extends React.Component<ClipPathViewProps> {}
declare const ClipPathViewBase: Constructor<NativeMethods> & typeof ClipPathComponent;

export  class ClipPathViewH extends ClipPathViewBase {}
export  class ClipPathView extends ClipPathViewBase {}

