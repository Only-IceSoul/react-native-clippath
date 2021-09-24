// main index.js



import { Platform,requireNativeComponent } from 'react-native';
import ClipPathWeb from './src/ClipPathWeb'

const ClipPathMobile =  requireNativeComponent('JJSClipPath',null)

export const ClipPathView = Platform.OS == 'android' || Platform.OS == 'ios' ? ClipPathMobile : ClipPathWeb
export const ClipPathViewN = Platform.OS == 'android' ? requireNativeComponent('JJSClipPathNone',null) : (Platform.OS == 'ios' ? ClipPathMobile : ClipPathWeb)
