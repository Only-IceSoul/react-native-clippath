// main index.js



import { Platform,requireNativeComponent } from 'react-native';
import ClipPathWeb from './src/ClipPathWeb'

export const ClipPathView = Platform.OS == 'android' || Platform.OS == 'ios' ? requireNativeComponent('ClipPath',null) : ClipPathWeb
export const ClipPathViewN = Platform.OS == 'android' ? requireNativeComponent('ClipPathNone',null) : (Platform.OS == 'ios' ? requireNativeComponent('ClipPath',null) : ClipPathWeb)
