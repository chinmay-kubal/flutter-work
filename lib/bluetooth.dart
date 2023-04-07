import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothWidget extends StatefulWidget {
  @override
  _BluetoothWidgetState createState() => _BluetoothWidgetState();
}

class _BluetoothWidgetState extends State<BluetoothWidget> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  late BluetoothDevice _device;
  late BluetoothConnection _connection;

  @override
  void initState() {
    super.initState();
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Bluetooth State: $_bluetoothState'),
        ElevatedButton(
          child: Text('Connect'),
          onPressed: _connect,
        ),
        ElevatedButton(
          child: Text('Disconnect'),
          onPressed: _disconnect,
        ),
      ],
    );
  }

  void _connect() async {
    List<BluetoothDevice> devices =
        await FlutterBluetoothSerial.instance.getBondedDevices();
    if (devices.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No devices found'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      _device = devices.first;
      await BluetoothConnection.toAddress(_device.address).then((connection) {
        setState(() {
          _connection = connection;
        });
      });
    }
  }

  void _disconnect() {
    _connection.close();
  }
}
