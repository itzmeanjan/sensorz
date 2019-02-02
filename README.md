# sensorz

A Simple Flutter Android App, which displays Android Sensor Data.



## Introduction ::

  - For implementation of UI, this app uses Flutter Framework.
  - Code base is written mainly using Dart and Kotlin, these two languages.
  - For accessing platform features, such as **Sensors**, Kotlin Language is used.
  - UI level coding is done using Dart Language.
  - For receiving continuous sensor data feed from platform level, EventChannel is used.
  - This Android App is tested to be properly working on Android Oreo (8.1.0).
  - This app uses Android Sensors Feature ( **android.hardware.sensor** ).
  - To install apk using **adb**, try running following command in your computer's console,
   after downloading apk. Make sure you have adb installed and PATH variable is properly set.
  ```
    >>> adb install app-release.apk
  ```
  
  - For more info on adb, head to this [link](https://developer.android.com/studio/command-line/adb).
  

## APK Download ::

  You could easily download the apk file [here](https://github.com/itzmeanjan/sensorz/blob/master/build/app/outputs/apk/release/app-release.apk).

  
## Screen Captures ::

  Well I've added some Screen Captures of the Android App, which I took while running it on a physical Android Device.



  ![First Screen Capture of Android App](https://github.com/itzmeanjan/sensorz/blob/master/Screenshot_20190202-002843.png)
  



  ![Second Screen Capture of Android App](https://github.com/itzmeanjan/sensorz/blob/master/Screenshot_20190202-002851.png)
  



  ![Third Screen Capture of Android App](https://github.com/itzmeanjan/sensorz/blob/master/Screenshot_20190202-002900.png)




## Implementation Info ::
  
  Lets first talk about Dart portion of the app ...
  
  ### UI using Dart :
  
   - In [main.dart](https://github.com/itzmeanjan/sensorz/blob/master/lib/main.dart), I created one Stateless Widget, **SensorMain** under which, initialRoute was **SensorMainHome**, which is a Stateful Widget.
   
   - As I'm using one Stateful Widget, I need to define a class which will be holding the current state of the app.
   
   - **_SensorMainState**, holds current state of app.
   
   - Overriding build method is required in **_SensorMainState**. So I used a Scaffold Widget, which is a very basic material based widget.
   
   - Well let me tell you one thing, in flutter, almost every UI component is a Widget.
   
   - For displaying sensor info and their live data feed, I'm using **LisView** layout manager.
   
   - A **Card** ( material design UI component ), is holding info regarding a certain sensor which is present on that device.
   
   - For invoking methods which are available in platform level ( Android API ), I used methodChannel.
   
   - First need to create an instance of method channel with one unique methodChannelName (String), the same name should be used in platform level code too.
   
   - That instance will help us to invoke methods which are defined in platform level.
   
   - One eventChannel is also created, which helps us to gain live sensor data updates from platform level.
   
   - Remember, we need to create both, methodChannel and eventChannel from platform level too, using same channel identifier string.
   
   - Check code comments, for more [info](https://github.com/itzmeanjan/sensorz/tree/master/lib).
  
  Going to platform level implementation of the app ...
  
  ### Platform Level Kotlin :
  
   - In [MainActivity.kt](https://github.com/itzmeanjan/sensorz/blob/master/android/app/src/main/kotlin/com/example/itzmeanjan/sensorz/MainActivity.kt), I registered methodChannel and eventChannel.
   
   - When **getSensorsList()** is invoked from platform level, a list of all sensors present in that device is returned back to UI level calling function.
   
   - And using the instance of **SensorManager** which I created at very beginning of app lifecycle, **SensorEventListener** is registered for all of those sensors.
   
   - For sending live sensor data feed to UI level, so that I can update UI as soon as data comes in, I wrote on class **MySensorListener**, which overrides **SensorEventListener**, and takes instance of **EventChannel.EventSink** as the only parameter.
   
   - In **onSensorChanged()**, I send sensor data back to UI level, where a listening service is already registered.
   
   - As soon as data comes in, UI level Dart code starts working for extracting that data and updates UI, so that changes gets reflected.
   
   
 Well this is it.

Hope it was helpful :)


For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
