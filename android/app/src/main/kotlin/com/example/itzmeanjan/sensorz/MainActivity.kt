package com.example.itzmeanjan.sensorz

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorManager
import android.os.Build
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val methodChannelName: String = "com.example.itzmeanjan.sensorz.androidMethodChannel"
    private val eventChannelName: String = "com.example.itzmeanjan.sensorz.androidEventChannel"
    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private lateinit var sensorManager: SensorManager
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        methodChannel = MethodChannel(flutterView, methodChannelName)
        methodChannel.setMethodCallHandler { methodCall, result ->
            when(methodCall.method){
                "getSensorsList" -> {
                    eventChannel = EventChannel(flutterView, eventChannelName)
                    result.success(getSensorsList())
                    initSensorEventListener()
                }
                else -> { }
            }
        }
    }

    private fun initSensorEventListener(){
        eventChannel.setStreamHandler(
                object :EventChannel.StreamHandler{
                    override fun onCancel(p0: Any?) {}

                    override fun onListen(p0: Any?, p1: EventChannel.EventSink?) {
                        if(p1!=null){
                            sensorManager.getSensorList(Sensor.TYPE_ALL).forEach {
                                sensorManager.registerListener(MySensorListener(p1),it,SensorManager.SENSOR_DELAY_NORMAL)
                            }
                        }
                    }
                }
        )
    }

    private fun extractSensorInfo(sensor: Sensor): Map<String, String>{
        return mapOf(
                "name" to sensor.name,
                "type" to sensor.type.toString(),
                "vendorName" to sensor.vendor.toString(),
                "version" to sensor.version.toString(),
                "resolution" to sensor.resolution.toString(),
                "power" to sensor.power.toString(),
                "maxRange" to sensor.maximumRange.toString(),
                "minDelay" to (sensor.minDelay.toFloat()/1000000.0).toString(),
                "reportingMode" to if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP) sensor.reportingMode.toString() else "NA",
                "maxDelay" to if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP) (sensor.maxDelay.toFloat()/1000000.0).toString() else "NA",
                "isWakeup" to if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP) sensor.isWakeUpSensor.toString() else "NA",
                "isDynamic" to if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.N) sensor.isDynamicSensor.toString() else "NA",
                "highestDirectReportRateValue" to if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.O) sensor.highestDirectReportRateLevel.toString() else "NA",
                "fifoReservedEventCount" to if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.KITKAT) sensor.fifoReservedEventCount.toString() else "NA",
                "fifoMaxEventCount" to if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.KITKAT) sensor.fifoMaxEventCount.toString() else "NA"
        )
    }

    private fun getSensorsList(): Map<String, List<Map<String, String>>>{
        val myMap = mutableMapOf<String, List<Map<String, String>>>()
        listOf(Sensor.TYPE_ACCELEROMETER, Sensor.TYPE_ACCELEROMETER_UNCALIBRATED, Sensor.TYPE_AMBIENT_TEMPERATURE, Sensor.TYPE_GAME_ROTATION_VECTOR, Sensor.TYPE_GEOMAGNETIC_ROTATION_VECTOR, Sensor.TYPE_GRAVITY, Sensor.TYPE_GYROSCOPE, Sensor.TYPE_GYROSCOPE_UNCALIBRATED, Sensor.TYPE_LIGHT, Sensor.TYPE_LINEAR_ACCELERATION, Sensor.TYPE_MAGNETIC_FIELD, Sensor.TYPE_MAGNETIC_FIELD_UNCALIBRATED, Sensor.TYPE_PRESSURE, Sensor.TYPE_PRESSURE, Sensor.TYPE_PROXIMITY, Sensor.TYPE_ROTATION_VECTOR, Sensor.TYPE_RELATIVE_HUMIDITY, Sensor.TYPE_STATIONARY_DETECT, Sensor.TYPE_MOTION_DETECT, Sensor.TYPE_LOW_LATENCY_OFFBODY_DETECT).forEach { elem ->
            val tmp = mutableListOf<Map<String, String>>()
            when(elem){
                Sensor.TYPE_ACCELEROMETER_UNCALIBRATED -> {
                    if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.O){
                        if(sensorManager.getSensorList(elem)!=null){
                            sensorManager.getSensorList(elem).forEach {
                                tmp.add(extractSensorInfo(it))
                            }
                        }
                    }
                }
                Sensor.TYPE_GAME_ROTATION_VECTOR -> {
                    if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.JELLY_BEAN_MR2){
                        if(sensorManager.getSensorList(elem)!=null){
                            sensorManager.getSensorList(elem).forEach {
                                tmp.add(extractSensorInfo(it))
                            }
                        }
                    }
                }
                Sensor.TYPE_GYROSCOPE_UNCALIBRATED -> {
                    if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.JELLY_BEAN_MR2){
                        if(sensorManager.getSensorList(elem)!=null){
                            sensorManager.getSensorList(elem).forEach {
                                tmp.add(extractSensorInfo(it))
                            }
                        }
                    }
                }
                Sensor.TYPE_GEOMAGNETIC_ROTATION_VECTOR -> {
                    if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.KITKAT){
                        if(sensorManager.getSensorList(elem)!=null){
                            sensorManager.getSensorList(elem).forEach {
                                tmp.add(extractSensorInfo(it))
                            }
                        }
                    }
                }
                Sensor.TYPE_MAGNETIC_FIELD_UNCALIBRATED -> {
                    if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.JELLY_BEAN_MR2){
                        if(sensorManager.getSensorList(elem)!=null){
                            sensorManager.getSensorList(elem).forEach {
                                tmp.add(extractSensorInfo(it))
                            }
                        }
                    }
                }
                Sensor.TYPE_LOW_LATENCY_OFFBODY_DETECT -> {
                    if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.O){
                        if(sensorManager.getSensorList(elem)!=null){
                            sensorManager.getSensorList(elem).forEach {
                                tmp.add(extractSensorInfo(it))
                            }
                        }
                    }
                }
                Sensor.TYPE_STATIONARY_DETECT -> {
                    if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.N){
                        if(sensorManager.getSensorList(elem)!=null){
                            sensorManager.getSensorList(elem).forEach {
                                tmp.add(extractSensorInfo(it))
                            }
                        }
                    }
                }
                Sensor.TYPE_MOTION_DETECT -> {
                    if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.N){
                        if(sensorManager.getSensorList(elem)!=null){
                            sensorManager.getSensorList(elem).forEach {
                                tmp.add(extractSensorInfo(it))
                            }
                        }
                    }
                }
                else -> {
                    if(sensorManager.getSensorList(elem)!=null){
                        sensorManager.getSensorList(elem).forEach {
                            tmp.add(extractSensorInfo(it))
                        }
                    }
                }
            }
            myMap[elem.toString()] = tmp
        }
        return myMap
        //initSensorEventListener()
    }
}
