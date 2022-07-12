import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class AutoDetect extends StatefulWidget {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final Map<Guid, List<int>> readValues = new Map<Guid, List<int>>();

  @override
  _AutoDetectState createState() => _AutoDetectState();
}

class _AutoDetectState extends State<AutoDetect> {
  BluetoothDevice device;
  bool _connected = false;

  @override
  void initState() {
    super.initState();
    widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        print('Result: ${result.device.id}');
        if (result.device.id.toString().substring(0, 7) == 'C1:1F:77') {
          print('Scan Result: ${result.device.id}');
          widget.flutterBlue.stopScan();
          print('Found the device');
          device = result.device;
          device.connect();
          //widget.readValues[characteristic.uuid] = value;
          print('Connected');
          setState(() {
            _connected = true;
          });
        }
      }
    });
//    widget.flutterBlue.connectedDevices
//        .asStream()
//        .listen((List<BluetoothDevice> devices) {
//      for (BluetoothDevice device in devices) {
//        if (device.id == DeviceIdentifier('C1:1F:77:8D:CD:D9')) {
//          print('Scan Device: ${device.id}');
//          widget.flutterBlue.stopScan();
//          device.connect();
//          //widget.readValues[characteristic.uuid] = value;
//          print('Connected');
//          setState(() {
//            _connected = true;
//          });
//        }
//        print('Connected: ${device.id.toString()}');
//        widget.flutterBlue.stopScan();
//      }
//    });
    widget.flutterBlue.startScan();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Auto Detect',
              ),
              Icon(Icons.flash_auto, size: 40),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: _connected ? Colors.blue : Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Icon(Icons.bluetooth,
                      color: _connected ? Colors.white : Colors.blue,
                      size: 40)),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
