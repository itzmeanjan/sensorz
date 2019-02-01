package com.example.itzmeanjan.sensorz

import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import io.flutter.plugin.common.EventChannel

class MySensorListener(eventSink: EventChannel.EventSink): SensorEventListener{
    private val _eventSink: EventChannel.EventSink = eventSink
    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {}

    override fun onSensorChanged(event: SensorEvent?) {
        if(event!=null)
            _eventSink.success(
                    mapOf(
                            "name" to event.sensor.name.toString(),
                            "type" to event.sensor.type.toString(),
                            "vendorName" to event.sensor.vendor.toString(),
                            "version" to event.sensor.version.toString(),
                            "values" to event.values.joinToString(separator = ";")
                    )
            )
    }
}
