# React Native ClipPath

android: api 21+   
ios : 10.0+   
web: svg    
  
<img src="./src/demo.jpg" width="200">

## Getting started

`$ npm install react-native-clippathview --save`

### Mostly automatic installation

`$ react-native link react-native-clippathview`  
  
### Yarn

`yarn add react-native-clippathview`

## IOS

**Add Swift**

(If you are using expo sdk >=42 you don't need to do this)

/ios/name_project

add a .swift file

# Usage
```javascript
import ClipPathView from 'react-native-clippathview'

// TODO: What to do with the module?
    <ClipPathView style={{backgroundColor:'green'}} 

        path={{
        d: myPath,
        viewBox: myViewBox
        }}
        
    
    >
  
        <View >
            <Text style={{color:'white'}}>hello world</Text>
        </View>
        
    </ClipPathView>

```

## Props   

[Props](./index.d.ts)

