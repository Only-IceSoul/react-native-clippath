import React from "react"
import { useMemo } from "react"
import { useRef } from "react"
import { useLayoutEffect, useState } from "react"
import { StyleSheet } from "react-native";


const Helper = require('svgpath');

var MOS_MEET = 0;
var MOS_SLICE = 1;
var MOS_NONE = 2; 


const  SVGViewBox = (vbRect,eRect,align, meetOrSlice)=> {
    // based on https://svgwg.org/svg2-draft/coords.html#ComputingAViewportsTransform

    // Let vb-x, vb-y, vb-width, vb-height be the min-x, min-y, width and height values of the viewBox attribute respectively.
    var vbX = vbRect.left ;
    var vbY = vbRect.top ;
    var vbX2 = vbRect.right ;
    var vbY2 = vbRect.bottom ;
    var vbWidth = vbX2 - vbX;
    var vbHeight = vbY2 - vbY;

    // Let e-x, e-y, e-width, e-height be the position and size of the element respectively.
    var eX = eRect.left;
    var eY = eRect.top;
    var eWidth = eRect.right - eRect.left;
    var eHeight = eRect.bottom - eRect.top;;


    // Initialize scale-x to e-width/vb-width.
    var scaleX = eWidth / vbWidth;

    // Initialize scale-y to e-height/vb-height.
    var scaleY = eHeight / vbHeight;

    // Initialize translate-x to e-x - (vb-x * scale-x).
    // Initialize translate-y to e-y - (vb-y * scale-y).
    var translateX = eX - (vbX * scaleX);
    var translateY = eY - (vbY * scaleY);



     //If align is 'none'
    if (meetOrSlice == MOS_NONE) {
        // Let scale be set the smaller value of scale-x and scale-y.
        // Assign scale-x and scale-y to scale.
        scaleX = scaleY = Math.min(scaleX, scaleY);
        translateX += (eWidth - vbWidth * scaleX) / 2.0;
        translateY += (eHeight - vbHeight * scaleY) / 2.0;


    } else {
        // If align is not 'none' and meetOrSlice is 'meet', set the larger of scale-x and scale-y to the smaller.
        // Otherwise, if align is not 'none' and meetOrSlice is 'slice', set the smaller of scale-x and scale-y to the larger.

        if (!(align === "none") && meetOrSlice == MOS_MEET) {
            scaleX = scaleY = Math.min(scaleX, scaleY);
        } else if (!(align === "none") && meetOrSlice == MOS_SLICE) {
            scaleX = scaleY = Math.max(scaleX, scaleY);
        }

        // If align contains 'xMid', add (e-width - vb-width * scale-x) / 2 to translate-x.
        if (align.includes("xMid")) {
            translateX += (eWidth - vbWidth * scaleX) / 2.0;
        }

        // If align contains 'xMax', add (e-width - vb-width * scale-x) to translate-x.
        if (align.includes("xMax")) {
            translateX += (eWidth - vbWidth * scaleX);
        }

        // If align contains 'yMid', add (e-height - vb-height * scale-y) / 2 to translate-y.
        if (align.includes("YMid")) {
            translateY += (eHeight - vbHeight * scaleY) / 2.0;
        }

        // If align contains 'yMax', add (e-height - vb-height * scale-y) to translate-y.
        if (align.includes("YMax")) {
            translateY += (eHeight - vbHeight * scaleY);
        }
    }


    // The transform applied to content contained by the element is given by
    // translate(translate-x, translate-y) scale(scale-x, scale-y).
    var result = [0 ,0,0,0]
    result[0] =  scaleX;
    result[1] =  scaleY;
    result[2] =  translateX;
    result[3] =  translateY;

    return result;

}

const viewBoxEvaluator = (value, start,end) => {
    return (value - start) / (end - start);
}



const ClipPathWeb  =  React.forwardRef((props,ref) =>{
    const refAlt =  useRef(null)
    const myRef = ref || refAlt

    const {
        d,
        viewBox,
        aspect,
        align,
   
        fillRule,

  
        strokeWidth,
        strokeStart,
        strokeEnd,
        dashArray,
        strokeCap,
        strokeJoin,
        strokeMiter,
                
        translateZ,

        transX,
        transY,
        transPercentageValue,

        rot,
        rotO,
        rotOx,
        rotOy,
        rotPercentageValue,

        sc,
        scX,
        scY,
        scO,
        scOx,
        scOy,
        scPercentageValue,
    
        style,
        ...rest 
    } = props

    const styleObject = useMemo(()=>{
        if (typeof style === 'number') return StyleSheet.flatten(style) 
        if(Array.isArray(style)){
           var styleJs = {}
           style.forEach((v)=>{
             if(typeof v === 'number'){
                let ss = StyleSheet.flatten(style) 
                Object.assign(styleJs,ss)
             }else{
               Object.assign(styleJs,v)
             }
           })
 
           return styleJs
        }
        return style
      },[style])

    const path = d === undefined ? "" : d
    const vb = viewBox === undefined ? [0,0,-1,-1] : viewBox
    const asp = aspect === undefined ? "meet" : aspect
    const alg = align === undefined ? "xMidYMid" : align


    const fr = fillRule === undefined ? "nonzero" : fillRule

    // const sw = strokeWidth === undefined ? 1 : strokeWidth
    // const cap = strokeCap === undefined ? "butt" : strokeCap
    // const join = strokeJoin === undefined ? "miter" : strokeJoin
    // const miterLimit = strokeMiter === undefined ? 4 : strokeMiter

    const zIndex = translateZ === undefined ? 0 : translateZ
    
    const dx = transX === undefined ? 0 : transX
    const dy = transY === undefined ? 0 : transY
    const transPercent = transPercentageValue === undefined ? false :true

    const scaleX = sc === undefined ? ( scX === undefined ? 1 : scX) : sc
    const scaleY = sc === undefined ?  (scY === undefined ? 1 : scY) : sc
    const scaleOX = scO === undefined ? ( scOx === undefined ? 0 : scOx) : scO
    const scaleOY = scO === undefined ?  (scOy === undefined ? 0 : scOy) : scO
    const scalePercent = scPercentageValue === undefined ? false :true

    const rotation = rot === undefined ? 0 : rot
    const rotationOX = rotO === undefined ? ( rotOx === undefined ? 0 : rotOx) : rotO
    const rotationOY = rotO === undefined ?  (rotOy === undefined ? 0 : rotOy) : rotO
    const rotationPercent = rotPercentageValue === undefined ? false :true
  
    const [bounds,setbounds] = useState({w:0,h:0})
    
    const finalPath = useMemo(()=>{
        if(d.length > 0 && bounds.w > 0 && bounds.h > 0){
            var vbLeft = vb[0]
            var vbTop = vb[1]
            var vbWidth = vb[2]
            var vbHeight = vb[3]
            var vbRight = vb[0] + vb[2]
            var vbBottom = vb[1] + vb[3] 
        
            var baseX = vbWidth / (bounds.w * vbWidth ) 
            var baseY = vbHeight / (bounds.h * vbHeight ) 

            var scVx = 1
            var scVy = 1
            var trVx = 0
            var trVy= 0
            var a = asp === "none" ? 2 : ( asp === "slice" ? 1 : 0)

            var rectLeft = 0
            var rectTop = 0
            var rectW = bounds.w
            var rectH = bounds.h


            if(vbWidth >= 0 && vbHeight >= 0){
                var resultVb = SVGViewBox(
                    {left: vbLeft , top:vbTop , right:vbRight , bottom: vbBottom},
                    { left: 0 ,top:0,right:bounds.w, bottom:bounds.h },
                    alg,
                    a,
                    )

                    scVx =  resultVb[0]
                    scVy =  resultVb[1]
                    trVx = resultVb[2] 
                    trVy = resultVb[3] 
               rectLeft = ( vbLeft * resultVb[0] ) + trVx
               rectTop = ( vbTop * resultVb[1] ) + trVy
               rectW = vbWidth * resultVb[0]
               rectH = vbHeight * resultVb[1]
            
           
            }
            

            //rotation

            var rotOriginX = rotationOX
            var rotOriginY = rotationOY

            if(rotationPercent){
                rotOriginX = rotationOX * bounds.w
                rotOriginY = rotationOY * bounds.h
            }else if(vbWidth >= 0 && vbHeight >= 0){
                rotOriginX = rectLeft +  (viewBoxEvaluator(rotationOX,vbLeft,vbRight) * rectW)
                rotOriginY = rectTop + (viewBoxEvaluator(rotationOY,vbTop,vbBottom) * rectH)
            }

            //scale 

            var scOriginX = scaleOX
            var scOriginY = scaleOY

            if(scalePercent){
                scOriginX = scaleOX * bounds.w
                scOriginY = scaleOY * bounds.h
            }else if(vbWidth >= 0 && vbHeight >= 0){
                scOriginX = rectLeft +  (viewBoxEvaluator(scaleOX,vbLeft,vbRight) * rectW)
                scOriginY = rectTop + (viewBoxEvaluator(scaleOY,vbTop,vbBottom) * rectH)
            }

        

            //translate
             var transPlusX = dx
             var transPlusY = dy
             if(transPercent){
                transPlusX = dx * bounds.w
                transPlusY = dy * bounds.h
             }else if(vb[2] >= 0 && vb[3] >= 0){
                transPlusX = (dx / vbWidth) * rectW
                transPlusY = (dy / vbHeight) * rectH
             }

           
 
          return  Helper(path)
          .scale(scVx,scVy)
          .translate(trVx,trVy)
     
          .rotate(rotation, rotOriginX ,rotOriginY )

          .translate(-scOriginX,-scOriginY)
          .scale(scaleX,scaleY)
          .translate(scOriginX,scOriginY)

          .translate(transPlusX,transPlusY)
     
          .scale(baseX,baseY)
   
       
          .toString()
        }
        return "";
},[bounds,dx,dy,scaleY,scaleX,scaleOX,scaleOY,path,rotation,rotationOX,rotationOY,asp,alg,vb,scalePercent,transPercent,rotationPercent])

    useLayoutEffect(()=>{
        let w = myRef.current.clientWidth
        let h = myRef.current.clientHeight
        if(w !== bounds.w || h !== bounds.h  ){
            setbounds({w:w,h:h})
        }
    })


    return(
        <>
            <div {...rest} ref={myRef} style={{...styleObject,clipPath:`${d.length > 0 ? 'url(#clipPathViewjjfl)' : ''}`, zIndex:zIndex}} >

            </div>
            <svg  style={{width:0,height:0}}>
            <defs>
                    <clipPath id="clipPathViewjjfl" 
                    clipPathUnits="objectBoundingBox" 
            
                    >
                          <path d={finalPath} fill={"black"} fillRule={fr} 

                          />
                    </clipPath>
                </defs>
            </svg>
         
        </>
    )
})


export default ClipPathWeb