// main index.js


import { Platform,requireNativeComponent } from 'react-native';
// import DrawableViewWeb from './src/DrawableViewWeb'

 const ClipPathView = Platform.OS == 'android' || Platform.OS == 'ios' ? requireNativeComponent('ClipPath',null) : null

 export default ClipPathView