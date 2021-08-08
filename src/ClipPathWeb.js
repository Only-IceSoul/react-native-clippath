import React from "react"
import { useMemo } from "react"
import { useRef } from "react"
import { useLayoutEffect, useState } from "react"


const Helper = require('svgpath')


const ClipPathView =  React.forwardRef((props,ref) =>{
    const refAlt =  useRef(null)
    const myRef = ref || refAlt
    const {
        path,
        pathScale,
        pathTranslation,
        pathRotation,
        ...rest 
    } = props


    const vb = path === undefined ? [0,0,0,0] : (path.viewBox === undefined ? [0,0,0,0] : path.viewBox) 
    const d = path === undefined ? "" : path.d
    const scale = pathScale === undefined ? 1 : pathScale
    const dx = pathTranslation === undefined ? 0 : pathTranslation.dx 
    const dy = pathTranslation === undefined ? 0 : pathTranslation.dy
    const isPercentTrans = pathTranslation === undefined ? false : pathTranslation.percentageValue
    const rot = pathRotation === undefined ? 0 : pathRotation


    // const [scaleBase,setScaleBase] = useState({x:0,y:0})
    const [bounds,setbounds] = useState({w:0,h:0})

    // const finalPath = useMemo(()=>{
    //         if(d.length > 0 && bounds.w > 0 && bounds.h > 0){
    //             let sx = bounds.w / vb[2]
    //             let sy = bounds.h / vb[3]

    //             let scaleBase = Math.min(sx,sy)
    //             let scaleBaseX = scaleBase * scale
    //             let scaleBaseY = scaleBase * scale
    //              var transXBase = 0 - (vb[0] * sx);
    //              var transYBase = 0 - (vb[1] * sy);
    //              let ws = vb[2] * scaleBaseX
    //              let hs = vb[3] * scaleBaseY
    //              transXBase += (bounds.w - ws) / 2.0
    //              transYBase += (bounds.h -  hs) / 2.0;

    //              var transPlusX = dx
    //              var transPlusY = dy
    //              if(isPercentTrans){
    //                 transPlusX = dx * bounds.w
    //                 transPlusY = dy * bounds.h
    //              }


    //            let result =  Helper(d)
    //             .scale(scaleBaseX,scaleBaseY)
    //             .translate(transXBase,transYBase)
    //             .rotate(rot, (bounds.w/2) , (bounds.h /2) )
    //             .translate(transPlusX,transPlusY)
            
    //             .toString()
     
    //           return  result
    //         }
    //         return "";
    // },[bounds,dx,dy,rot,scale,d])


    const finalPath = useMemo(()=>{
        if(d.length > 0 && bounds.w > 0 && bounds.h > 0){
            let sx = bounds.w / vb[2]
            let sy = bounds.h / vb[3]

            let scaleBase = Math.min(sx,sy) * scale
     
             var transXBase = 0 - (vb[0] * sx);
             var transYBase = 0 - (vb[1] * sy);
             let ws = vb[2] * scaleBase
             let hs = vb[3] * scaleBase
             transXBase += (bounds.w - ws) / 2.0
             transYBase += (bounds.h -  hs) / 2.0;

             var transPlusX = dx
             var transPlusY = dy
             if(isPercentTrans){
                transPlusX = dx * bounds.w
                transPlusY = dy * bounds.h
             }

             let vw = vb[2]
             let vh = vb[3]
             let scaleRelX = vw / (bounds.w * vw ) 
             let scaleRelY = vh / (bounds.h * vh ) 
 
          return  Helper(d)
          .scale(scaleBase,scaleBase)
          .translate(transXBase,transYBase)
          .rotate(rot, (bounds.w/2) , (bounds.h /2) )
          .translate(transPlusX,transPlusY)
           .scale(scaleRelX,scaleRelY)
          .toString()
        }
        return "";
},[bounds,dx,dy,rot,scale,d])

    useLayoutEffect(()=>{
        let w = myRef.current.clientWidth
        let h = myRef.current.clientHeight
        if(w !== bounds.w || h !== bounds.h  ){
            // let vw = vb[2]
            // let vh = vb[3]
            // let baseX = vw / (w * vw ) 
            // let baseY = vh / (h * vh ) 
            setbounds({w:w,h:h})
            // setScaleBase({x:baseX,y:baseY})
        }
    })

    return(
        <>
            <div {...rest} ref={myRef} style={{...props.style,clipPath:`${d.length > 0 ? 'url(#clipPathViewjjfl)' : ''}`}} >

            </div>
            <svg style={{width:0,height:0}}
            >
                <defs>
                    <clipPath id="clipPathViewjjfl" clipPathUnits="objectBoundingBox" 
                    // transform={`scale(${scaleBase.x} ${scaleBase.y}) `}
                    >
                          <path d={finalPath} />
                    </clipPath>
                </defs>
            </svg>
        </>
    )
})


export default ClipPathView