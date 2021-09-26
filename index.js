// main index.js



import { Platform,requireNativeComponent } from 'react-native';
import ClipPathWeb from './src/ClipPathWeb'

const ClipPathMobile = requireNativeComponent ? requireNativeComponent('JJSClipPath',null) : null
const ClipPathMobileNone = requireNativeComponent ? requireNativeComponent('JJSClipPathNone',null) : null

export const ClipPathViewH = Platform.OS == 'android' || Platform.OS == 'ios' ? ClipPathMobile : ClipPathWeb
export const ClipPathView = Platform.OS == 'android' ? ClipPathMobileNone : (Platform.OS == 'ios' ? ClipPathMobile : ClipPathWeb)
