import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String _result = '';

  Future<void> _scanQRCode() async {
    final status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      String? qrCode = await scanner.scan();

      if (qrCode != null) {
        setState(() {
          _result = qrCode;
        });
      }
    } else {
      // Permission denied
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Camera permission denied'),
          content: Text('Please grant camera permission to scan QR codes.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scanned QR Code:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              _result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scanQRCode,
        icon: Icon(Icons.qr_code_scanner),
        label: Text('Scan QR Code'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
