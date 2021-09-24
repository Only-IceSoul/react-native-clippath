// main index.js



import { Platform,requireNativeComponent } from 'react-native';
import ClipPathWeb from './src/ClipPathWeb'

export const ClipPathView = Platform.OS == 'android' || Platform.OS == 'ios' ? requireNativeComponent('JJSClipPath',null) : ClipPathWeb
export const ClipPathViewN = Platform.OS == 'android' ? requireNativeComponent('JJSClipPathNone',null) : (Platform.OS == 'ios' ? null : ClipPathWeb)
