// main index.js


import { Platform,requireNativeComponent } from 'react-native';
import ClipPathWeb from './src/ClipPathWeb'

 const ClipPathView = Platform.OS == 'android' || Platform.OS == 'ios' ? requireNativeComponent('ClipPath',null) : ClipPathWeb

 export default ClipPathView