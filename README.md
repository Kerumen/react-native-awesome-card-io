# react-native-awesome-card-io
A complete and **cross-platform** card.io component for React Native.

## Getting started

`$ npm install react-native-awesome-card-io --save`

### Automatic installation

`$ react-native link react-native-awesome-card-io`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-awesome-card-io` and add `RNCardIo.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCardIO.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.cardio.RNCardIOPackage;` to the imports at the top of the file
  - Add `new RNCardIOPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-awesome-card-io'
  	project(':react-native-awesome-card-io').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-awesome-card-io/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-awesome-card-io')
  	```
