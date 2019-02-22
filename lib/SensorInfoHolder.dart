import 'package:flutter/material.dart';

class SensorInfoHolder {
  SensorInfoHolder(
      this.name,
      this.type,
      this.vendorName,
      this.version,
      this.power,
      this.resolution,
      this.maxRange,
      this.maxDelay,
      this.minDelay,
      this.reportingMode,
      this.isWakeup,
      this.isDynamic,
      this.highestDirectReportRateValue,
      this.fifoMaxEventCount,
      this.fifoReservedEventCount) {
    type = '${_getTypeToName(type)} ($type)';
  }
  String name;
  String type;
  String vendorName;
  String version;
  String power;
  String resolution;
  String maxRange;
  String maxDelay;
  String minDelay;
  String reportingMode;
  String isWakeup;
  String isDynamic;
  String highestDirectReportRateValue;
  String fifoMaxEventCount;
  String fifoReservedEventCount;
  String _getTypeToName(String type) {
    return <String, String>{
      '1': 'Accelerometer',
      '35': 'Uncalibrated Accelerometer',
      '9': 'Gravity',
      '10': 'Linear Acceleration',
      '2': 'Magnetic Field',
      '3': 'Orientation',
      '4': 'Gyroscope',
      '16': 'Uncalibrated Gyroscope',
      '31': 'Heeat Beat',
      '5': 'Ambient Light',
      '6': 'Atmospheric Pressure',
      '8': 'Proximity',
      '11': 'Rotation Vector',
      '15': 'Game Rotation Vector',
      '20': 'Geo Magnetic Rotaion Vector',
      '12': 'Relative Humidity',
      '13': 'Ambient Room Temperature',
      '29': 'Stationary Detect',
      '30': 'Motion Detect',
      '34': 'Low Latency Off Body Detect',
    }[type];
  }

  List<Widget> displaySensorData() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.name,
            style: TextStyle(
                color: Colors.cyanAccent, fontStyle: FontStyle.italic),
          ),
          Text(
            this.vendorName,
            style: TextStyle(
                color: Colors.greenAccent, fontWeight: FontWeight.bold),
          )
        ],
      ),
      Divider(
        height: 14.0,
        color: Colors.black54,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Type',
          ),
          Text(
            this.type,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Version',
          ),
          Text(
            this.version,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Power',
          ),
          Text(
            '${this.power} mA',
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Resolution',
          ),
          Text(
            '${this.resolution} unit',
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Maximum Range',
          ),
          Text(
            '${this.maxRange} unit',
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Maximum Delay',
          ),
          Text(
            '${this.maxDelay} s',
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Minimum Delay',
          ),
          Text(
            '${this.minDelay} s',
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Reporting Mode',
          ),
          Text(
            <String, String>{
              '0': 'Continuous',
              '1': 'On Change',
              '2': 'One Shot',
              '3': 'Special Trigger',
              'NA': 'NA',
            }[this.reportingMode],
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Wake Up',
          ),
          Text(
            this.capitalize(this.isWakeup),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Dynamic',
          ),
          Text(
            this.capitalize(this.isDynamic),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Highest Direct Report Rate Value',
          ),
          Text(
            <String, String>{
              '0': 'Unsupported',
              '1': 'Normal',
              '2': 'Fast',
              '3': 'Very Fast',
              'NA': 'NA',
            }[this.highestDirectReportRateValue],
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Fifo Max Event Count',
          ),
          Text(
            this.fifoMaxEventCount,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Fifo Reserved Event Count',
          ),
          Text(
            this.fifoReservedEventCount,
          ),
        ],
      )
    ];
  }

  List<Widget> appendThem(List<Widget> myList) {
    List<Widget> target = this.displaySensorData();
    myList.forEach((Widget element) {
      target.add(element);
    });
    return target;
  }

  String capitalize(String str) {
    return str.replaceFirst(str[0], str[0].toUpperCase());
  }
}

class Accelerometer {
  // type 1
  Accelerometer(this.sensor, this.x, this.y, this.z);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  Card getCard() {
    return Card(
      // Accelerometer
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along X-axis'),
                Text('${this.x} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along Y-axis'),
                Text('${this.y} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along Z-axis'),
                Text('${this.z} m/s^2'),
              ],
            )
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class UncalibratedAccelerometer {
  // type 35
  UncalibratedAccelerometer(
      this.sensor,
      this.xUncalib,
      this.yUncalib,
      this.zUnclaib,
      this.estimatedXBias,
      this.estimatedYBias,
      this.estimatedZBias);
  SensorInfoHolder sensor;
  String xUncalib;
  String yUncalib;
  String zUnclaib;
  String estimatedXBias;
  String estimatedYBias;
  String estimatedZBias;
  Card getCard() {
    return Card(
      // Uncalibrated Accelerometer
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('X Uncalibrated'),
                Text('${this.xUncalib} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Y Uncalibrated'),
                Text('${this.yUncalib} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Z Uncalibrated'),
                Text('${this.zUnclaib} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Estimated X Bias'),
                Text('${this.estimatedXBias} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Estimated Y Bias'),
                Text('${this.estimatedYBias} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Estimated Z Bias'),
                Text('${this.estimatedZBias} m/s^2'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class Gravity {
  // type 9
  Gravity(this.sensor, this.x, this.y, this.z);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  Card getCard() {
    return Card(
      // Gravity
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along X-axis'),
                Text('${this.x} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along Y-axis'),
                Text('${this.y} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along Z-axis'),
                Text('${this.z} m/s^2'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class LinearAcceleration {
  // type 10
  LinearAcceleration(this.sensor, this.x, this.y, this.z);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  Card getCard() {
    return Card(
      // Linear Acceleration
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along X-axis'),
                Text('${this.x} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along Y-axis'),
                Text('${this.y} m/s^2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along Z-axis'),
                Text('${this.z} m/s^2'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class MagneticField {
  // type 2
  MagneticField(this.sensor, this.x, this.y, this.z);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  Card getCard() {
    return Card(
      // Magnetic Field
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along X-axis'),
                Text('${this.x} uT'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along Y-axis'),
                Text('${this.y} uT'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Along Z-axis'),
                Text('${this.z} uT'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class OrientationSensor {
  // type 3
  OrientationSensor(this.sensor, this.azimuth, this.pitch, this.roll);
  SensorInfoHolder sensor;
  String azimuth;
  String pitch;
  String roll;
  Card getCard() {
    return Card(
      // Orientation Sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Azimuth'),
                Text('${this.azimuth}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Pitch'),
                Text('${this.pitch}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Roll'),
                Text('${this.roll}'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class Gyroscope {
  // type 4
  Gyroscope(this.sensor, this.angularSpeedAroundX, this.angularSpeedAroundY,
      this.angularSpeedAroundZ);
  SensorInfoHolder sensor;
  String angularSpeedAroundX;
  String angularSpeedAroundY;
  String angularSpeedAroundZ;
  Card getCard() {
    return Card(
      // Gyroscope
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Angular Speed around X'),
                Text('${this.angularSpeedAroundX} rad/s'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Angular Speed around Y'),
                Text('${this.angularSpeedAroundY} rad/s'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Angular Speed around Z'),
                Text('${this.angularSpeedAroundZ} rad/s'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class UncalibratedGyroscope {
  // type 16
  UncalibratedGyroscope(
      this.sensor,
      this.angularSpeedAroundX,
      this.angularSpeedAroundY,
      this.angularSpeedAroundZ,
      this.estimatedDriftAroundX,
      this.estimatedDriftAroundY,
      this.estimatedDriftAroundZ);
  SensorInfoHolder sensor;
  String angularSpeedAroundX;
  String angularSpeedAroundY;
  String angularSpeedAroundZ;
  String estimatedDriftAroundX;
  String estimatedDriftAroundY;
  String estimatedDriftAroundZ;
  Card getCard() {
    return Card(
      // Uncalibrated Gyroscope
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Angular Speed around X'),
                Text('${this.angularSpeedAroundX} rad/s'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Angular Speed around Y'),
                Text('${this.angularSpeedAroundY} rad/s'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Angular Speed around Z'),
                Text('${this.angularSpeedAroundZ} rad/s'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Estimated Drift around X'),
                Text('${this.estimatedDriftAroundX} rad/s'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Estimated Drift around Y'),
                Text('${this.estimatedDriftAroundY} rad/s'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Estimated Drift around Z'),
                Text('${this.estimatedDriftAroundZ} rad/s'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class HeartBeat {
  // type 31
  HeartBeat(this.sensor, this.confidence);
  SensorInfoHolder sensor;
  String confidence;
  Card getCard() {
    return Card(
      // HeartBeat Sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Confidence'),
                Text('${this.confidence}'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class AmbientLight {
  // type 5
  AmbientLight(this.sensor, this.level);
  SensorInfoHolder sensor;
  String level;
  Card getCard() {
    return Card(
      // Ambient Light Sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Ambient Light Level'),
                Text('${this.level} lux'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class AtmosphericPressure {
  // type 6
  AtmosphericPressure(this.sensor, this.pressure);
  SensorInfoHolder sensor;
  String pressure;
  Card getCard() {
    return Card(
      // Atmospheric Pressure
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Atmospheric Pressure'),
                Text('${this.pressure} hPa'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class Proximity {
  // type 8
  Proximity(this.sensor, this.distance);
  SensorInfoHolder sensor;
  String distance;
  Card getCard() {
    return Card(
      // Proximity Sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Distance From Screen'),
                Text('${this.distance} cm'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class RotationVector {
  // type 11
  RotationVector(this.sensor, this.x, this.y, this.z, this.someVal,
      this.estimatedHeadingAccuracy);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  String someVal;
  String estimatedHeadingAccuracy;
  Card getCard() {
    return Card(
      // Rotation Vector Sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('X * Sin(\u{03b8}/2)'),
                Text('${this.x}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Y * Sin(\u{03b8}/2)'),
                Text('${this.y}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Z * Sin(\u{03b8}/2)'),
                Text('${this.z}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Cos(\u{03b8}/2)'),
                Text('${this.someVal}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Estimated Heading Accuracy'),
                Text('${this.estimatedHeadingAccuracy} rad'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class GameRotationVector {
  // type 15
  GameRotationVector(this.sensor, this.x, this.y, this.z, this.someVal,
      this.estimatedHeadingAccuracy);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  String someVal;
  String estimatedHeadingAccuracy;
  Card getCard() {
    return Card(
      // Game Rotation Vector Sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('X * Sin(\u{03b8}/2)'),
                Text('${this.x}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Y * Sin(\u{03b8}/2)'),
                Text('${this.y}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Z * Sin(\u{03b8}/2)'),
                Text('${this.z}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Cos(\u{03b8}/2)'),
                Text('${this.someVal}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Estimated Heading Accuracy'),
                Text('${this.estimatedHeadingAccuracy} rad'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class GeoMagneticRotationVector {
  // type 20
  GeoMagneticRotationVector(this.sensor, this.x, this.y, this.z, this.someVal,
      this.estimatedHeadingAccuracy);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  String someVal;
  String estimatedHeadingAccuracy;
  Card getCard() {
    return Card(
      // Geomagnetic Rotation Vector Sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('X * Sin(\u{03b8}/2)'),
                Text('${this.x}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Y * Sin(\u{03b8}/2)'),
                Text('${this.y}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Z * Sin(\u{03b8}/2)'),
                Text('${this.z}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Cos(\u{03b8}/2)'),
                Text('${this.someVal}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Estimated Heading Accuracy'),
                Text('${this.estimatedHeadingAccuracy} rad'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class RelativeHumidity {
  // type 12
  RelativeHumidity(this.sensor, this.humidity);
  SensorInfoHolder sensor;
  String humidity;
  Card getCard() {
    return Card(
      // Relative Humidity
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Relative Air Humidity'),
                Text('${this.humidity} %'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class AmbientRoomTemperature {
  // type 13
  AmbientRoomTemperature(this.sensor, this.temperature);
  SensorInfoHolder sensor;
  String temperature;
  Card getCard() {
    return Card(
      // Gravity
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Temperature'),
                Text('${this.temperature} C'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class LowLatencyOffBodyDetect {
  // type 34
  LowLatencyOffBodyDetect(this.sensor, this.offBodyState);
  SensorInfoHolder sensor;
  String offBodyState;

  String getStateText() {
    return this.offBodyState == '1.0' ? 'Device on-body' : 'Device off-body';
  }

  Card getCard() {
    return Card(
      // Low latency off body detect sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Off Body State'),
                Text('${getStateText()}'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class MotionDetect {
  // type 30
  MotionDetect(this.sensor, this.isInMotion);
  SensorInfoHolder sensor;
  String isInMotion;

  String getStateText() {
    return this.isInMotion == '1.0'
        ? 'Device in Motion'
        : 'Device not in Motion';
  }

  Card getCard() {
    return Card(
      // Motion detect sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Motion Detection'),
                Text('${getStateText()}'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class StationaryDetect {
  // type 29
  StationaryDetect(this.sensor, this.isImmobile);
  SensorInfoHolder sensor;
  String isImmobile;

  String getStateText() {
    return this.isImmobile == '1.0'
        ? 'Device in Stationary State'
        : 'Device not in Stationary State';
  }

  Card getCard() {
    return Card(
      // Motion detect sensor
      margin: EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: this.sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Motion Detection'),
                Text('${getStateText()}'),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}
