// main index.js



import { Platform,requireNativeComponent } from 'react-native';
import ClipPathWeb from './src/ClipPathWeb'

const ClipPathMobile =  requireNativeComponent('JJSClipPath',null)
const ClipPathMobileN = requireNativeComponent('JJSClipPathNone',null) 

export const ClipPathView = Platform.OS == 'android' || Platform.OS == 'ios' ? ClipPathMobile : ClipPathWeb
export const ClipPathViewN = Platform.OS == 'android' ? ClipPathMobileN : (Platform.OS == 'ios' ? ClipPathMobile : ClipPathWeb)
